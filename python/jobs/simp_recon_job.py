"""!
Space rad events and run readout and reconstruction.
"""
from hpsmc.tools import ExtractEventsWithHitAtHodoEcal, LCIOCount, JobManager

## Get job input file targets
inputs = list(job.input_files.values())

job.description = 'simp to recon'

if 'event_interval' in job.params:
    event_interval = job.params['event_interval']
else:
    event_interval = 1

## Input rad events (slcio format)
simp_file_name = 'simp_events.slcio'

## Recon
reco = JobManager(inputs=[simp_file_name], steering='recon')

comps = [reco]
job.add(comps)
