"""!
run reconstruction
"""
from hpsmc.tools import JobManager

## Get job input file targets
inputs = list(job.input_files.values())

job.description = 'run reconstruction'

if 'nevents' in job.params:
    nevents = job.params['nevents']
else:
    nevents = 10000

## Run physics reconstruction
recon = JobManager(steering='recon',
                   inputs=['tritrig-beam_readout.slcio'],
                   outputs=['tritrig-beam_recon_oldB.slcio'])

job.add([recon])
