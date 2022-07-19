#!/bin/sh
hps-mc-batch slurm -o -q shared -r 1:10000 -E /sdf/group/hps/users/sgaiser/src/hps-mc/install/bin/hps-mc-env.sh -W 5 -d /scratch/sgaiser/beam -c /sdf/group/hps/users/sgaiser/src/hps-mc/examples/beam_gen/.hpsmc -l /scratch/sgaiser/beam/logs beam_gen /sdf/group/hps/users/sgaiser/src/hps-mc/examples/beam_gen/jobs.json 
