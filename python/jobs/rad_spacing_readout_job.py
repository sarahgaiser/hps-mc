"""!
Space rad events and run readout and reconstruction.
"""
from hpsmc.tools import ExtractEventsWithHitAtHodoEcal, LCIOCount, JobManager

## Get job input file targets
inputs = list(job.input_files.values())

job.description = 'rad to recon'

if 'event_interval' in job.params:
    event_interval = job.params['event_interval']
else:
    event_interval = 1

## Input rad events (slcio format)
rad_file_name = 'rad_events.slcio'

## Base name of intermediate ap files
rad_name = 'rad'

## Space signal events before merging
filter_bunches = ExtractEventsWithHitAtHodoEcal(inputs=[rad_file_name],
                                                outputs=['%s_filt.slcio' % rad_name],
                                                event_interval=event_interval, num_hodo_hits=0)

## Readout
readout = JobManager(steering='readout')

comps = [filter_bunches, readout]
job.add(comps)
