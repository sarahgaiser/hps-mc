"""!
@file muon_trident_gen_job.py

Simulate muon trident events.
"""
from hpsmc.generators import MG5

job.description = 'Generate muon trident events using MadGraph5'

if 'nevents' in job.params:
    nevents = job.params['nevents']
else:
    nevents = 10000

## Generate muon tridents in MG5
mg = MG5(name='muon', event_types=['unweighted'])

## Run the job
job.add([mg])
