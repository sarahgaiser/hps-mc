#!/bin/sh

export JOBDIR=/sdf/home/s/sgaiser/src/hps-mc/prod/slac/mcprod_2021/tritrig/gen_to_slic
export RUNDIR=/sdf/data/hps/physics2021/run/prod/tritrig/gen

hps-mc-batch slurm -o -r 1:1000 -E /sdf/home/s/sgaiser/src/hps-mc/install/bin/hps-mc-env.sh -W 3 -q milano -A HPS:hps-prod -d $RUNDIR  -c $JOBDIR/.hpsmc -l /sdf/data/hps/physics2021/mc/gen/tritrig/pass_v8beta/HPS_Run2021Pass1_v8beta_template/logs tritrig_gen_to_slic $JOBDIR/jobs.json 

