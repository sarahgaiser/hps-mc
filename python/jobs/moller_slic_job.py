"""!
@file slic_job.py

Simulation of signals in detector using SLIC.
"""
import os
from hpsmc.tools import SLIC, AddMotherFullTruth

job.description = 'detector sim via slic'

## Get job input file targets
inputs = list(job.input_files.values())

slic = SLIC(inputs=inputs)

## Run the job
job.add([slic])
