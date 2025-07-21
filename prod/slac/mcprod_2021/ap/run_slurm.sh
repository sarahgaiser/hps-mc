#!/bin/sh

export JOBDIR=/sdf/home/s/sgaiser/src/hps-mc/prod/slac/mcprod_2021/ap
export RUNDIR=/sdf/data/hps/physics2021/run/prod/ap/gen

hps-mc-batch slurm -o -r 3001:4000 -E /sdf/home/s/sgaiser/src/hps-mc/install/bin/hps-mc-env.sh -W 5 -m 4000 -q milano -A HPS:hps-prod -d $RUNDIR  -c $JOBDIR/.hpsmc -l /sdf/data/hps/physics2021/mc/gen/ap/pass_v7/3pt74/ap60MeV/logs ap_gen_to_slic $JOBDIR/jobs_ap180.json 

