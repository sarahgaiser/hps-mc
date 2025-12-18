#!/bin/sh

export JOBDIR=/sdf/home/s/sgaiser/src/hps-mc/prod/slac/mcprod_2021/wab/gen_to_slic
export RUNDIR=/sdf/data/hps/physics2021/run/prod/wab/gen

hps-mc-batch slurm -o -r 8001:10000 -E /sdf/home/s/sgaiser/src/hps-mc/install/bin/hps-mc-env.sh -W 3 -q roma -A HPS:hps-prod -d $RUNDIR  -c $JOBDIR/.hpsmc -l /sdf/data/hps/physics2021/mc/gen/wab/pass_v8/logs wab_gen_to_slic $JOBDIR/jobs.json 

