from hpsmc.generators import MG5, StdHepConverter
from hpsmc.tools import SLIC, JobManager, FilterBunches, BeamCoords, AddMother, HPSTR

import os

job.description = 'Run slic with preexisting tritrig stdhep files'

# generate events in slic
sim = SLIC()

# insert empty bunches expected by pile-up simulation
filter_bunches = FilterBunches()

# Run simulated events in readout to generate triggers
readout = JobManager(steering='readout')

# Run physics reconstruction
recon = JobManager(steering='recon')

# Convert LCIO to ROOT
root_cnv = HPSTR(cfg='recon')

# Run an analysis on the ROOT file
ana = HPSTR(cfg='ana')

# Set persistency tags for output files
base_name,ext = os.path.splitext(list(job.input_files.values())[0])
job.ptag('recon', '{}_filt_readout_recon.slcio'.format(base_name))
job.ptag('ana', '{}_filt_readout_recon_ana.root'.format(base_name))

# Add job components
job.add([sim, filter_bunches, readout, recon, root_cnv, ana])