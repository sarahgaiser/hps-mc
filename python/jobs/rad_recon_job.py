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

## Recon
reco = JobManager(inputs=[rad_file_name], steering='recon')

comps = [reco]
job.add(comps)
