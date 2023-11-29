#!/bin/bash

source /sdf/group/hps/users/sgaiser/src/hps-mc/install/bin/hps-mc-env.sh
echo Start time: `date`
echo PWD=`pwd`
echo ---- Start Environment ----
env | sort
echo ---- End Environment ----
time /usr/bin/python3 /sdf/group/hps/users/sgaiser/src/hps-mc/install/lib/python/hpsmc/job.py run -o /scratch/s/sgaiser/tritrig_beam/logs/job.26.out -e /scratch/s/sgaiser/tritrig_beam/logs/job.26.err -d /scratch/s/sgaiser/tritrig_beam/26 -c /sdf/group/hps/users/sgaiser/src/hps-mc/prod/slac/tritrig_beam/recon/.hpsmc -i 26 /sdf/group/hps/users/sgaiser/src/hps-mc/install/lib/python/jobs/readout_recon_job.py /sdf/group/hps/users/sgaiser/src/hps-mc/prod/slac/tritrig_beam/recon/jobs.json
echo End time: `date`
