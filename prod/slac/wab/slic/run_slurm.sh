#!/bin/sh
hps-mc-batch slurm -o -q HPS:hps-prod -r 1001:2000 -E /sdf/home/s/sgaiser/src/hps-mc/install/bin/hps-mc-env.sh -W 5 -d /fs/ddn/sdf/scratch/s/sgaiser/wab/slic -c /sdf/home/s/sgaiser/src/hps-mc/prod/slac/wab/slic/.hpsmc -l /fs/ddn/sdf/scratch/s/sgaiser/wab/slic/logs wab_prep_and_slic /sdf/home/s/sgaiser/src/hps-mc/prod/slac/wab/slic/jobs.json 
