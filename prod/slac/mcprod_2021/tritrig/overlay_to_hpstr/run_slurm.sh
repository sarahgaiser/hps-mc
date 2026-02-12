#!/bin/sh

export JOBDIR=/sdf/home/s/sgaiser/src/hps-mc/prod/slac/mcprod_2021/tritrig/overlay_to_hpstr
export RUNDIR=/sdf/data/hps/physics2021/run/prod/tritrig/overlay

hps-mc-batch slurm -o -r 1:401 -E /sdf/home/s/sgaiser/src/hps-mc/install/bin/hps-mc-env.sh -W 4 -m 4000 -q roma -A HPS:hps-prod -d $RUNDIR  -c $JOBDIR/.hpsmc -l $RUNDIR/logs signal_pulser_overlay_to_recon $JOBDIR/jobs_14596.json 

#hps-mc-batch slurm -o -r 1:1000 -E /sdf/home/s/sgaiser/src/hps-mc/install/bin/hps-mc-env.sh -W 2 -m 6000 -q milano -A HPS:hps-prod -d $RUNDIR -c $JOBDIR/.hpsmc -l $RUNDIR/logs recon $JOBDIR/jobs_recon.json

#hps-mc-batch slurm -o -r 501:1000 -E /sdf/home/s/sgaiser/src/hps-mc/install/bin/hps-mc-env.sh -W 3 -q milano -A HPS:hps-prod -d $RUNDIR -c $JOBDIR/.hpsmc -l $RUNDIR/logs hpstr $JOBDIR/jobs_hpstr.json
