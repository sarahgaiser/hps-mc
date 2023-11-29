#!/bin/bash

source /sdf/group/hps/users/sgaiser/src/hps-mc/install/bin/hps-mc-env.sh
echo Start time: `date`
echo PWD=`pwd`
echo ---- Start Environment ----
env | sort
echo ---- End Environment ----
time /usr/bin/python3 /sdf/group/hps/users/sgaiser/src/hps-mc/install/lib/python/hpsmc/job.py run -o /scratch/s/sgaiser/beam/gen/20umW/logs/job.2.out -e /scratch/s/sgaiser/beam/gen/20umW/logs/job.2.err -d /scratch/s/sgaiser/beam/gen/20umW/2 -c /sdf/group/hps/users/sgaiser/src/hps-mc/prod/slac/beam/gen/3pt74_20umW/.hpsmc -i 2 /sdf/group/hps/users/sgaiser/src/hps-mc/install/lib/python/jobs/beam_gen_job.py /sdf/group/hps/users/sgaiser/src/hps-mc/prod/slac/beam/gen/3pt74_20umW/jobs.json
echo End time: `date`
