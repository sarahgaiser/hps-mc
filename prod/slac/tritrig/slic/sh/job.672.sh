#!/bin/bash

source /sdf/home/s/sgaiser/src/hps-mc/install/bin/hps-mc-env.sh
echo Start time: `date`
echo PWD=`pwd`
echo ---- Start Environment ----
env | sort
echo ---- End Environment ----
time /usr/bin/python3 /sdf/home/s/sgaiser/src/hps-mc/install/lib/python/hpsmc/job.py run -o /fs/ddn/sdf/scratch/s/sgaiser/tritrig/slic/logs/job.672.out -e /fs/ddn/sdf/scratch/s/sgaiser/tritrig/slic/logs/job.672.err -d /fs/ddn/sdf/scratch/s/sgaiser/tritrig/slic/672 -c /sdf/home/s/sgaiser/src/hps-mc/prod/slac/tritrig/slic/.hpsmc -i 672 /sdf/home/s/sgaiser/src/hps-mc/install/lib/python/jobs/tritrig_prep_and_slic_job.py /sdf/home/s/sgaiser/src/hps-mc/prod/slac/tritrig/slic/jobs.json
echo End time: `date`
