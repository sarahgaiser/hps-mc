#!/bin/sh

export JOBDIR=/sdf/home/s/sgaiser/src/hps-mc/prod/slac/mcprod_2021/ap/gen_to_slic
export RUNDIR=/sdf/data/hps/physics2021/run/prod/ap/gen/ap180

hps-mc-batch slurm -o -r 1:1000 -E /sdf/home/s/sgaiser/src/hps-mc/install/bin/hps-mc-env.sh -W 2 -m 4000 -q roma -A HPS:hps-prod -d $RUNDIR  -c $JOBDIR/.hpsmc -l /sdf/data/hps/physics2021/mc/gen/ap/pass5_v9/3pt74/ap180MeV/logs ap_gen_to_slic $JOBDIR/jobs_ap180.json 

