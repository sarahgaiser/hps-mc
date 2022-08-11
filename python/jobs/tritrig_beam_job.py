"""!
Merge tritrig and beam events, simulate signal events, and detector readout.
"""
from hpsmc.generators import StdHepConverter
from hpsmc.tools import BeamCoords, AddMother, MergePoisson, RandomSample, MergeFiles
from hpsmc.tools import SLIC, JobManager, FilterBunches, HPSTR, LCIOCount, LCIOMerge, StdHepCount, ExtractEventsWithHitAtHodoEcal

## Get job input file targets
inputs = list(job.input_files.values())

job.description = 'tritrig beam'

#if 'event_interval' in job.params:
#    event_interval = job.params['event_interval']
#else:
#    event_interval = 250

if 'nevents' in job.params:
    nevents = job.params['nevents']
else:
    nevents = 10000

## Input tritrig events (stdhep format)
tritrig_file_name = 'tritrig_events.stdhep'

## Input beam events (StdHep format)
beam_file_names = []
#beam_rot_file_names = []
beam_slic_file_names = []
for i in range(1,11):
    beam_file_names.append('beam_%i.stdhep'%i)
    #beam_rot_file_names.append('rot_beam_%i.stdhep'%i)
    beam_slic_file_names.append('beam_%i.slcio'%i)

## Check for expected input file targets
if tritrig_file_name not in inputs:
    raise Exception("Missing required input file '%s'" % tritrig_file_name)
if beam_file_names[1] not in inputs:
    raise Exception("Missing required input file '%s'" % beam_file_names[1])

## Base name of intermediate tritrig files
tritrig_name = 'tritrig'

## Base name of intermediate beam files
beam_name = 'beam'

## Base name of merged files
tritrig_beam_name = 'tritrig-beam'

## Convert LHE output to stdhep
#cnv = StdHepConverter(inputs=[tritrig_file_name],
#                      outputs=['%s.stdhep' % tritrig_name])

## Add mother particle to tag trident particles
#mom = AddMother(inputs=cnv.output_files(),
#                outputs=['%s_mom.stdhep' % tritrig_name])

## Rotate events into beam coords
#rot = BeamCoords(inputs=mom.output_files(),
#                outputs=['%s_rot.stdhep' % tritrig_name])

## Simulate signal events
slic = SLIC(inputs=[tritrig_file_name],
            outputs=['%s.slcio' % tritrig_name])

## Space signal events before merging
filter_bunches = ExtractEventsWithHitAtHodoEcal(inputs=slic.output_files(),
                                                   outputs=['%s_filt.slcio' % tritrig_name],
                                                   event_interval=250, num_hodo_hits=0)
#filter_bunches = FilterBunches(inputs=slic.output_files(),
#                               outputs=['%s_filt.slcio' % tritrig_name])

## Count filtered events
count_filter = LCIOCount(inputs=filter_bunches.output_files())

## Transform beam events
#rot_beams = []
#for i in range(len(beam_file_names)):
#  rot_beams.append(BeamCoords(inputs=[beam_file_names[i]],
#                              outputs=[beam_rot_file_names[i]])
#                              )


## Print number of beam sampled events
#count_beam = StdHepCount(inputs=sample_beam.output_files())

## Simulate beam events
slic_beams = []
for i in range(len(beam_file_names)):
    slic_beams.append(SLIC(inputs=[beam_file_names[i]],
                      outputs=[beam_slic_file_names[i]],
                      nevents=nevents*250,
                      ignore_job_params=['nevents'])
                      )

## concatonate beam events before merging
slic_beam_cat = ExtractEventsWithHitAtHodoEcal(inputs=beam_slic_file_names,
                                                   outputs=['beam_cat.slcio'],
                                                   event_interval=0, num_hodo_hits=0)

## Merge signal and beam events
merge = LCIOMerge(inputs=[filter_bunches.output_files()[0],
                          slic_beam_cat.outputs[0]],
                  outputs=['%s.slcio' % tritrig_beam_name],
                  ignore_job_params=['nevents'])
#merge = LCIOMerge(inputs=[filter_bunches.output_files()[0],
#                          slic_beam_cat.outputs[0]],
#                  outputs=['%s.slcio' % tritrig_beam_name],
#                  ignore_job_params=['nevents'])

## Print number of merged events
count_merge = LCIOCount(inputs=merge.output_files())

## Run simulated events in readout to generate triggers
readout = JobManager(steering='readout',
                     inputs=merge.output_files(),
                     outputs=['%s_readout.slcio' % tritrig_beam_name])

## Print number of readout events
count_readout = LCIOCount(inputs=readout.output_files())

## Run physics reconstruction
recon = JobManager(steering='recon',
                   inputs=readout.output_files(),
                   outputs=['%s_recon.slcio' % tritrig_beam_name])

## Print number of recon events
count_recon = LCIOCount(inputs=recon.output_files())

# Convert LCIO to ROOT
#tuple = HPSTR(cfg='recon', 
#              inputs=recon.output_files(),
#              outputs=['%s_recon.root' % tritrig_beam_name])

# Run an analysis on the ROOT file
#ana = HPSTR(cfg='ana',
#            inputs=tuple.output_files(),
#            outputs=['%s_ana.root' % tritrig_beam_name])
 
## Add the components
#job.add([cnv, mom, rot, slic, filter_bunches, count_filter,
#         count_beam, slic_beam, merge, count_merge, readout, count_readout, 
#         recon, count_recon])

comps = [slic, filter_bunches, count_filter]
for i in range(len(slic_beams)): comps.append(slic_beams[i])
comps.extend([slic_beam_cat, merge, count_merge, readout, count_readout, recon, count_recon])
job.add(comps)

## \todo cleanup