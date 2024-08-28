#!/bin/bash

source /sdf/home/s/sgaiser/src/hps-mc/install/bin/hps-mc-env.sh
echo Start time: `date`
echo PWD=`pwd`
echo ---- Start Environment ----
env | sort
echo ---- End Environment ----
time /usr/bin/python3 /sdf/home/s/sgaiser/src/hps-mc/install/lib/python/hpsmc/job.py run -o /fs/ddn/sdf/scratch/s/sgaiser/wab/slic/logs/job.1427.out -e /fs/ddn/sdf/scratch/s/sgaiser/wab/slic/logs/job.1427.err -d /fs/ddn/sdf/scratch/s/sgaiser/wab/slic/1427 -c /sdf/home/s/sgaiser/src/hps-mc/prod/slac/wab/slic/.hpsmc -i 1427 /sdf/home/s/sgaiser/src/hps-mc/install/lib/python/jobs/wab_prep_and_slic_job.py /sdf/home/s/sgaiser/src/hps-mc/prod/slac/wab/slic/jobs.json
echo End time: `date`
