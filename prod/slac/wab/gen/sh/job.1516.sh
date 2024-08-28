#!/bin/bash

source /sdf/home/s/sgaiser/src/hps-mc/install/bin/hps-mc-env.sh
echo Start time: `date`
echo PWD=`pwd`
echo ---- Start Environment ----
env | sort
echo ---- End Environment ----
time /usr/bin/python3 /sdf/home/s/sgaiser/src/hps-mc/install/lib/python/hpsmc/job.py run -o /fs/ddn/sdf/scratch/s/sgaiser/wab/gen/logs/job.1516.out -e /fs/ddn/sdf/scratch/s/sgaiser/wab/gen/logs/job.1516.err -d /fs/ddn/sdf/scratch/s/sgaiser/wab/gen/1516 -c /sdf/home/s/sgaiser/src/hps-mc/prod/slac/wab/gen/.hpsmc -i 1516 /sdf/home/s/sgaiser/src/hps-mc/install/lib/python/jobs/wab_gen_job.py /sdf/home/s/sgaiser/src/hps-mc/prod/slac/wab/gen/jobs.json
echo End time: `date`
