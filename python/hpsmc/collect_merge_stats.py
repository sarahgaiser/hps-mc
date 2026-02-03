#!/usr/bin/env python3
"""
Collector script for MergeROOT statistics files.

This script aggregates merge statistics JSON files from multiple jobs
and produces a summary report.

Usage:
    hps-mc-collect-merge-stats <dir> [-o output.json] [-p pattern] [-q]
"""

import argparse
import glob
import json
import os
import sys


class MergeStatsCollector:
    """
    Collects and aggregates MergeROOT statistics from JSON files.
    """

    def __init__(self, search_dir, pattern="**/*_stats.json"):
        """
        Initialize the collector.

        Parameters
        ----------
        search_dir : str
            Directory to search for stats files
        pattern : str
            Glob pattern for finding stats files (default: **/*_stats.json)
        """
        self.search_dir = search_dir
        self.pattern = pattern
        self.stats_files = []
        self.job_stats = []
        self.summary = {}

    def find_stats_files(self):
        """
        Find all stats JSON files matching the pattern.

        Returns
        -------
        list
            List of paths to stats files found
        """
        search_pattern = os.path.join(self.search_dir, self.pattern)
        self.stats_files = sorted(glob.glob(search_pattern, recursive=True))
        return self.stats_files

    def collect(self):
        """
        Collect and aggregate statistics from all found files.

        Returns
        -------
        dict
            Aggregated statistics dictionary
        """
        if not self.stats_files:
            self.find_stats_files()

        self.job_stats = []
        successful_jobs = 0
        failed_jobs = 0
        total_input_files = 0
        tree_totals = {}

        for stats_file in self.stats_files:
            try:
                with open(stats_file, 'r') as f:
                    stats = json.load(f)

                self.job_stats.append({
                    "file": stats_file,
                    "stats": stats
                })

                # Track validation results
                if stats.get("validation_passed", False):
                    successful_jobs += 1
                else:
                    failed_jobs += 1

                # Count input files
                total_input_files += stats.get("num_input_files", 0)

                # Aggregate tree totals (use output events as source of truth)
                output_events = stats.get("output_events", {})
                for tree_name, count in output_events.items():
                    if tree_name not in tree_totals:
                        tree_totals[tree_name] = {"input": 0, "output": 0}
                    tree_totals[tree_name]["output"] += count

                # Sum up input events
                total_input_events = stats.get("total_input_events", {})
                for tree_name, count in total_input_events.items():
                    if tree_name not in tree_totals:
                        tree_totals[tree_name] = {"input": 0, "output": 0}
                    tree_totals[tree_name]["input"] += count

            except (json.JSONDecodeError, IOError) as e:
                print("WARNING: Could not read stats file %s: %s" % (stats_file, e),
                      file=sys.stderr)
                failed_jobs += 1
                continue

        # Build summary
        self.summary = {
            "summary": {
                "total_jobs": len(self.job_stats),
                "successful_jobs": successful_jobs,
                "failed_jobs": failed_jobs,
                "total_input_files": total_input_files,
                "all_validations_passed": failed_jobs == 0 and len(self.job_stats) > 0
            },
            "tree_totals": tree_totals,
            "jobs": [js["stats"] for js in self.job_stats]
        }

        return self.summary

    def write_summary(self, output_file):
        """
        Write the summary to a JSON file.

        Parameters
        ----------
        output_file : str
            Path to output JSON file
        """
        if not self.summary:
            self.collect()

        with open(output_file, 'w') as f:
            json.dump(self.summary, f, indent=2)

    def print_report(self, quiet=False):
        """
        Print a human-readable summary report.

        Parameters
        ----------
        quiet : bool
            If True, only print summary line
        """
        if not self.summary:
            self.collect()

        s = self.summary["summary"]

        if quiet:
            status = "PASS" if s["all_validations_passed"] else "FAIL"
            print("%s: %d jobs, %d input files" % (
                status, s["total_jobs"], s["total_input_files"]))
            return

        print()
        print("=" * 70)
        print("MergeROOT Statistics Summary")
        print("=" * 70)
        print()
        print("Search directory: %s" % self.search_dir)
        print("Stats files found: %d" % len(self.stats_files))
        print()
        print("-" * 70)
        print("Job Summary")
        print("-" * 70)
        print("  Total jobs:        %d" % s["total_jobs"])
        print("  Successful jobs:   %d" % s["successful_jobs"])
        print("  Failed jobs:       %d" % s["failed_jobs"])
        print("  Total input files: %d" % s["total_input_files"])
        print()

        # Tree totals
        tree_totals = self.summary.get("tree_totals", {})
        if tree_totals:
            print("-" * 70)
            print("Event Counts by Tree")
            print("-" * 70)
            print("%-30s %15s %15s %10s" % ("Tree Name", "Input Events", "Output Events", "Status"))
            print("-" * 70)

            for tree_name, counts in sorted(tree_totals.items()):
                input_count = counts["input"]
                output_count = counts["output"]
                if input_count == output_count:
                    status = "PASS"
                else:
                    status = "FAIL"
                print("%-30s %15d %15d %10s" % (tree_name, input_count, output_count, status))

            print("-" * 70)
        print()

        # Final status
        if s["all_validations_passed"]:
            print("OVERALL STATUS: PASS")
        else:
            print("OVERALL STATUS: FAIL")

        print("=" * 70)
        print()


def main():
    """Main entry point for the collector script."""
    parser = argparse.ArgumentParser(
        description="Collect and aggregate MergeROOT statistics from JSON files.",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Examples:
    # Collect stats from current directory
    hps-mc-collect-merge-stats .

    # Collect stats and write summary to file
    hps-mc-collect-merge-stats /path/to/output -o summary.json

    # Use custom pattern
    hps-mc-collect-merge-stats . -p "**/merge_*_stats.json"

    # Quiet mode (single line output)
    hps-mc-collect-merge-stats . -q
"""
    )

    parser.add_argument(
        "directory",
        help="Directory to search for stats files"
    )
    parser.add_argument(
        "-o", "--output",
        help="Output JSON file for aggregated summary"
    )
    parser.add_argument(
        "-p", "--pattern",
        default="**/*_stats.json",
        help="Glob pattern for stats files (default: **/*_stats.json)"
    )
    parser.add_argument(
        "-q", "--quiet",
        action="store_true",
        help="Quiet mode - only print summary line"
    )

    args = parser.parse_args()

    # Validate directory
    if not os.path.isdir(args.directory):
        print("ERROR: Directory not found: %s" % args.directory, file=sys.stderr)
        sys.exit(1)

    # Create collector and run
    collector = MergeStatsCollector(args.directory, args.pattern)
    stats_files = collector.find_stats_files()

    if not stats_files:
        print("WARNING: No stats files found matching pattern '%s' in %s" % (
            args.pattern, args.directory), file=sys.stderr)
        sys.exit(0)

    # Collect and report
    collector.collect()
    collector.print_report(quiet=args.quiet)

    # Write output file if requested
    if args.output:
        collector.write_summary(args.output)
        if not args.quiet:
            print("Summary written to: %s" % args.output)

    # Exit with appropriate code
    if collector.summary["summary"]["all_validations_passed"]:
        sys.exit(0)
    else:
        sys.exit(1)


if __name__ == "__main__":
    main()
