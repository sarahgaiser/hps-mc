#!/bin/bash
#
# Example workflow for merging ROOT files from multiple run directories
#
# Arguments:
#   parent_dir: Directory containing run subdirectories
#   -o: Output prefix for generated files
#   -n: Maximum number of files per merge job (default: 20)
#   -f: File pattern to match (default: *.root)
#   -r: Run directory pattern (default: hps_*)
#   -F: Path filter - only include files whose full path contains this string

PARENT_DIR="/sdf/data/hps/physics2021/mc/hpstr/simp_pulser_new/pass5_v9/HPS_Run2021Pass1_v9_14272/"
#PARENT_DIR="/sdf/data/hps/physics2021/mc/hpstr/ap_pulser/pass5_v9/"
#PARENT_DIR="/sdf/data/hps/physics2021/mc/hpstr/tritrig_pulser/pass5_v9/HPS_Run2021Pass1_v9_14272_hitSmearKill-reprocess/"
OUTPUT_PREFIX="merge_jobs"
MAX_FILES=25

hps-mc-prepare-merge-jobs \
    $PARENT_DIR \
    -o $OUTPUT_PREFIX \
    -n $MAX_FILES \
#    -F reprocess
#    -r ap* \
#    -F "pass5_v9" \
#    --single-list

# This creates:
#   - merge_jobs_input_files.txt  (single consolidated file list)
#   - merge_jobs_vars.json        (iteration variables for template)
#   - merge_jobs_batches.json     (metadata about batches)

# Step 2: Generate job configurations using template
# ------------------------------------------------------

for batch_file in ${OUTPUT_PREFIX}_batch*_files.txt; do
    batch_num=$(echo $batch_file | grep -oP 'batch\K[0-9]+')
    hps-mc-job-template \
        -j $batch_num \
        -i root_files $batch_file $(wc -l < $batch_file) \
        signal.tmpl \
        ${OUTPUT_PREFIX}_batch${batch_num}_jobs.json
done

cat ${OUTPUT_PREFIX}_batch*_jobs.json | jq -s 'add' > ${OUTPUT_PREFIX}_jobs.json
