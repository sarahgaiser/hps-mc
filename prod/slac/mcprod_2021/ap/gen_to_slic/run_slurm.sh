#!/bin/sh

export JOBDIR=/sdf/home/s/sgaiser/src/hps-mc/prod/slac/mcprod_2021/ap/gen_to_slic
export RUNDIR=/sdf/data/hps/physics2021/run/prod/ap/gen/ap80

hps-mc-batch slurm -o -r 1:1000 -E /sdf/home/s/sgaiser/src/hps-mc/install/bin/hps-mc-env.sh -W 2 -m 4000 -q roma -A HPS:hps-prod -d $RUNDIR  -c $JOBDIR/.hpsmc -l $RUNDIR/logs ap_gen_to_slic $JOBDIR/jobs_ap80_tgt_m0pt1mm.json 

