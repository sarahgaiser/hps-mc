
from hpsmc.tools import ExtractEventsWithHitAtHodoEcal, EvioToLcio, JobManager, FilterBunches, LCIOCount

job.description = 'pulser spacing'

## Get job input file targets
inputs = list(job.input_files.values())

## Input signal events (slcio format)
signal_file_name = []

## Input pulser events (slcio format)
pulser_file_name = []

for input in inputs:
    if "signal" in input:
        signal_file_name.append(input)
    if "pulser" in input:
        pulser_file_name.append(input)

## Check for expected input file targets
if len(signal_file_name) == 0:
    raise Exception("Missing required input file(s) for signal")
if len(pulser_file_name) == 0:
    raise Exception("Missing required input file(s) for pulser data")


## Base name of merged files
signal_pulser_name = 'pulser'


## Space overlaid events
space_overlay = FilterBunches(inputs=['signal_pulser.slcio'],
                              filter_no_cuts=True,
                              outputs=['%s_spaced.slcio' % signal_pulser_name],
                              filter_event_interval=250)

## Print number of merged events
count_space_overlay = LCIOCount(inputs=space_overlay.output_files())


## Add the components
job.add([space_overlay, count_space_overlay])

