#!/bin/bash

source /sdf/home/s/sgaiser/src/hps-mc/install/bin/hps-mc-env.sh
echo Start time: `date`
echo PWD=`pwd`
echo ---- Start Environment ----
env | sort
echo ---- End Environment ----
time /usr/bin/python3 /sdf/home/s/sgaiser/src/hps-mc/install/lib/python/hpsmc/job.py run -o /fs/ddn/sdf/scratch/s/sgaiser/wab/slic/logs/job.1775.out -e /fs/ddn/sdf/scratch/s/sgaiser/wab/slic/logs/job.1775.err -d /fs/ddn/sdf/scratch/s/sgaiser/wab/slic/1775 -c /sdf/home/s/sgaiser/src/hps-mc/prod/slac/wab/slic/.hpsmc -i 1775 /sdf/home/s/sgaiser/src/hps-mc/install/lib/python/jobs/wab_prep_and_slic_job.py /sdf/home/s/sgaiser/src/hps-mc/prod/slac/wab/slic/jobs.json
echo End time: `date`
