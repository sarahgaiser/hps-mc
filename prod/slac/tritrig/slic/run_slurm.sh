#!/bin/sh
hps-mc-batch slurm -o -q HPS:hps-prod -r 1:1000 -E /sdf/home/s/sgaiser/src/hps-mc/install/bin/hps-mc-env.sh -W 5 -d /fs/ddn/sdf/scratch/s/sgaiser/tritrig/slic -c /sdf/home/s/sgaiser/src/hps-mc/prod/slac/tritrig/slic/.hpsmc -l /fs/ddn/sdf/scratch/s/sgaiser/tritrig/slic/logs tritrig_prep_and_slic /sdf/home/s/sgaiser/src/hps-mc/prod/slac/tritrig/slic/jobs.json 
