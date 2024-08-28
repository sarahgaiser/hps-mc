#!/bin/sh
hps-mc-batch slurm -o -q HPS:hps-prod -r 1001:2000 -E /sdf/home/s/sgaiser/src/hps-mc/install/bin/hps-mc-env.sh -W 5 -d /fs/ddn/sdf/scratch/s/sgaiser/wab/gen -c /sdf/home/s/sgaiser/src/hps-mc/prod/slac/wab/gen/.hpsmc -l /fs/ddn/sdf/scratch/s/sgaiser/wab/gen/logs wab_gen /sdf/home/s/sgaiser/src/hps-mc/prod/slac/wab/gen/jobs.json 
