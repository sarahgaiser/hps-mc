"""!
@file signal_pulser_overlay_to_recon_job.py

Overlay random beam and MC signal.
"""

from hpsmc.tools import JobManager, FilterBunches, LCIOCount, HPSTR

job.description = 'signal-pulser from readout to recon'

## Get job input file targets
inputs = list(job.input_files.values())

## Base name of merged files
signal_pulser_name = 'signal_pulser'

## Run simulated events in readout to generate triggers
readout = JobManager(steering='readout',
                     inputs=inputs,
                     outputs=['%s_readout.slcio' % signal_pulser_name])

## Print number of readout events
count_readout = LCIOCount(inputs=readout.output_files())

## Run physics reconstruction
recon = JobManager(steering='recon',
                   inputs=['%s_readout.slcio' % signal_pulser_name],
                   outputs=['%s_recon.slcio' % signal_pulser_name])

## Print number of recon events
count_recon = LCIOCount(inputs=recon.output_files())

## Convert LCIO to ROOT
cnv = HPSTR(cfg='cnv')

## Run an analysis on the ROOT file
ana = HPSTR(cfg='ana')

## Add the components
job.add([readout, count_readout, recon, count_recon, cnv, ana])

