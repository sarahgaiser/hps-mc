#!/bin/bash

source /sdf/group/hps/users/sgaiser/src/hps-mc/install/bin/hps-mc-env.sh
echo Start time: `date`
echo PWD=`pwd`
echo ---- Start Environment ----
env | sort
echo ---- End Environment ----
time /usr/bin/python3 /sdf/group/hps/users/sgaiser/src/hps-mc/install/lib/python/hpsmc/job.py run -o /scratch/s/sgaiser/beam/slic/3pt74_20umW/logs/job.78.out -e /scratch/s/sgaiser/beam/slic/3pt74_20umW/logs/job.78.err -d /scratch/s/sgaiser/beam/slic/3pt74_20umW/78 -c /sdf/group/hps/users/sgaiser/src/hps-mc/prod/slac/beam/slic/3pt74_20umW/.hpsmc -i 78 /sdf/group/hps/users/sgaiser/src/hps-mc/install/lib/python/jobs/beam_prep_and_slic_job.py /sdf/group/hps/users/sgaiser/src/hps-mc/prod/slac/beam/slic/3pt74_20umW/jobs.json
echo End time: `date`
