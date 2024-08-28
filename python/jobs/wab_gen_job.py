"""!
@file wab_gen_job.py

Python script for generating WAB events in StdHep format.

"""

from hpsmc.generators import MG4
from hpsmc.tools import BeamCoords, MergePoisson
from hpsmc.generators import StdHepConverter

job.description = 'WAB gen'

## generate tritrig in MG4
mg = MG4(name="wab")

## Add components 
job.add([mg])
