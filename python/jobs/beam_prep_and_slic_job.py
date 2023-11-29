"""!
@file beam_prep_and_slic_job.py

Transform events to beam coodinates, randomly sample them and simulating detector response using slic.
"""
from hpsmc.tools import BeamCoords, RandomSample, MergePoisson, SLIC

if 'nevents' in job.params:
    nevents = job.params['nevents']
else:
    nevents = 10000

if 'event_interval' in job.params:
    event_interval = job.params['event_interval']
else:
    event_interval = 1

if 'use_poisson' in job.params:
    use_poisson = job.params['use_poisson']
else:
    use_poisson = False

## Get job input file targets
inputs = list(job.input_files.values())

## Rotate events into beam coordinates
rot = BeamCoords()

## Sample events into new stdhep file
sample = RandomSample()
if use_poisson:
    sample = MergePoisson(xsec=7.55e10)


## Simulate detector response
# slic = SLIC(nevents=nevents * event_interval, ignore_job_params=['nevents'])
slic = SLIC()

## Run the job
job.add([rot, sample, slic])
