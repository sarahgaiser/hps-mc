"""!
Merge ap and beam events.
"""
from hpsmc.tools import LCIOMerge, ExtractEventsWithHitAtHodoEcal, LCIOCount

## Get job input file targets
inputs = list(job.input_files.values())

job.description = 'ap beam'

if 'event_interval' in job.params:
    event_interval = job.params['event_interval']
else:
    event_interval = 1

## Input ap events (slcio format)
ap_file_name = 'ap_events.slcio'

## Input beam events (slcio format)
beam_file_names = []
for i in range(len(inputs)):
    if inputs[i] != ap_file_name:
        beam_file_names.append(inputs[i])

## Base name of intermediate ap files
ap_name = 'ap'

## Base name of merged files
ap_beam_name = 'ap_beam'

## Space signal events before merging
filter_bunches = ExtractEventsWithHitAtHodoEcal(inputs=[ap_file_name],
                                                outputs=['%s_filt.slcio' % ap_name],
                                                event_interval=event_interval, num_hodo_hits=0)

## concatonate beam events before merging
slic_beam_cat = ExtractEventsWithHitAtHodoEcal(inputs=beam_file_names,
                                               outputs=['beam_cat.slcio'],
                                               ignore_job_params=['event_interval'],
                                               event_interval=0, num_hodo_hits=0)

## Merge signal and beam events
merge = LCIOMerge(inputs=[filter_bunches.output_files()[0],
                          slic_beam_cat.outputs[0]],
                  outputs=['%s.slcio' % ap_beam_name],
                  ignore_job_params=['nevents'])

# count_merge = LCIOCount()

comps = [filter_bunches]
#comps = [filter_bunches, slic_beam_cat, merge]
job.add(comps)
