#!/bin/sh

export JOBDIR=/sdf/home/s/sgaiser/src/hps-mc/prod/slac/mcprod_2021/rad/gen_to_slic
export RUNDIR=/sdf/data/hps/physics2021/run/prod/rad/gen

#hps-mc-batch slurm -o -r 1:20 -E $JOBDIR/setup.sh -W 3 -q roma -A HPS:hps-prod -d $RUNDIR -c $JOBDIR/.hpsmc -l /sdf/data/hps/physics2021/mc/gen/rad/pass5_v9/logs rad_gen_to_slic $JOBDIR/jobs.json 

hps-mc-batch slurm -o -r 1:2000 -E /sdf/home/s/sgaiser/src/hps-mc/install/bin/hps-mc-env.sh -W 3 -q roma -A HPS:hps-prod -d $RUNDIR  -c $JOBDIR/.hpsmc -l /sdf/data/hps/physics2021/mc/gen/rad/pass5_v9/logs rad_gen_to_slic $JOBDIR/jobs_14596.json

