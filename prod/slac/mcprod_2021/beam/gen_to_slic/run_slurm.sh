#!/bin/sh

export JOBDIR=/sdf/home/s/sgaiser/src/hps-mc/prod/slac/mcprod_2021/beam/gen_to_slic
export RUNDIR=/sdf/data/hps/physics2021/run/prod/beam/gen

#hps-mc-batch slurm -o -r 1:50 -E /sdf/home/s/sgaiser/src/hps-mc/install/bin/hps-mc-env.sh -W 12 -m 6000 -q milano -A HPS:hps-prod -d $RUNDIR  -c $JOBDIR/.hpsmc -l /sdf/data/hps/physics2021/mc/gen/beam/pass_v8beta/HPS_Run2021Pass1_v8beta_14272/logs beam_gen_to_slic $JOBDIR/jobs.json 

hps-mc-batch slurm -o -r 1:1000 -E /sdf/home/s/sgaiser/src/hps-mc/install/bin/hps-mc-env.sh -W 12 -m 6000 -q milano -A HPS:hps-prod -d $RUNDIR  -c $JOBDIR/.hpsmc -l /sdf/data/hps/physics2021/mc/gen/beam/pass5_v9/HPS_Run2021Pass1_v9_14272/logs beam_prep_and_slic $JOBDIR/jobs.json
