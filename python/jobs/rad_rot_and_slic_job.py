"""!
@file tritrig_prep_and_slic_job.py

Add mother particle information to tritrig events and rotate them into beam coordinates before simulating detector response using slic.
"""
from hpsmc.generators import StdHepConverter
from hpsmc.tools import Unzip, AddMotherFullTruth, BeamCoords, SLIC

job.description = 'Convert tritrig events to StdHep and simulate detector response'

## Get job input file targets
inputs = list(job.input_files.values())

## Rotate events into beam coords
rot = BeamCoords(inputs=inputs)

## Simulate detector response
slic = SLIC(inputs=rot.output_files())

## Run the job
job.add([rot, slic])
