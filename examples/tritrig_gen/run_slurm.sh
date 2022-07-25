#!/bin/sh
hps-mc-batch slurm -o -q hps -r 2002:2002 -E /sdf/group/hps/users/sgaiser/src/hps-mc/install/bin/hps-mc-env.sh -W 5 -d /scratch/sgaiser/tritrig -c /sdf/group/hps/users/sgaiser/src/hps-mc/examples/tritrig_gen/.hpsmc -l /scratch/sgaiser/tritrig/logs tritrig_gen /sdf/group/hps/users/sgaiser/src/hps-mc/examples/tritrig_gen/jobs.json 
