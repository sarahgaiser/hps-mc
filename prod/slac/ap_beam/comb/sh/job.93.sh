#!/bin/bash

source /sdf/group/hps/users/sgaiser/src/hps-mc/install/bin/hps-mc-env.sh
echo Start time: `date`
echo PWD=`pwd`
echo ---- Start Environment ----
env | sort
echo ---- End Environment ----
time /usr/bin/python3 /sdf/group/hps/users/sgaiser/src/hps-mc/install/lib/python/hpsmc/job.py run -o /scratch/s/sgaiser/ap_beam/comb/logs/job.93.out -e /scratch/s/sgaiser/ap_beam/comb/logs/job.93.err -d /scratch/s/sgaiser/ap_beam/comb/93 -c /sdf/group/hps/users/sgaiser/src/hps-mc/prod/slac/ap_beam/comb/.hpsmc -i 93 /sdf/group/hps/users/sgaiser/src/hps-mc/install/lib/python/jobs/ap_beam_job.py /sdf/group/hps/users/sgaiser/src/hps-mc/prod/slac/ap_beam/comb/jobs.json
echo End time: `date`
