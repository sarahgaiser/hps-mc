"""!
@file simp_job.py

Simulation of SIMP decays, detector interactions via slic
"""
from hpsmc.tools import SLIC, BeamCoords, Unzip, DisplaceUni

job.description = 'SIMP displacement to slic'

## Unzip LHE file
unzip = Unzip(inputs=['simp_unweighted_events.lhe.gz'], outputs=['simp.lhe'])

## Convert LHE output to stdhep (no displacement here because no ctau given)
cnv = DisplaceUni(inputs=['simp.lhe'], outputs=['simp.stdhep'])

## Rotate into beam coords
rot = BeamCoords()

## Run events in slic
slic = SLIC()

## Run the job
job.add([unzip, cnv, rot, slic])
