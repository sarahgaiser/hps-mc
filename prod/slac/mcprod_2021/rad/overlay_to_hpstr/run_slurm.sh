#!/bin/sh

export JOBDIR=/sdf/home/s/sgaiser/src/hps-mc/prod/slac/mcprod_2021/rad/overlay_to_hpstr
export RUNDIR=/sdf/data/hps/physics2021/run/prod/rad/overlay/14272

hps-mc-batch slurm -o -r 1:400 -E /sdf/home/s/sgaiser/src/hps-mc/install/bin/hps-mc-env.sh -W 3 -m 6000 -q milano -A HPS:hps-prod -d $RUNDIR  -c $JOBDIR/.hpsmc -l $RUNDIR/logs signal_pulser_overlay_to_recon $JOBDIR/jobs_14272.json 

#hps-mc-batch slurm -o -r 1:400 -E /sdf/home/s/sgaiser/src/hps-mc/install/bin/hps-mc-env.sh -W 3 -m 6000 -q milano -A HPS:hps-prod -d $RUNDIR -c $JOBDIR/.hpsmc -l $RUNDIR/logs recon $JOBDIR/jobs_recon.json
