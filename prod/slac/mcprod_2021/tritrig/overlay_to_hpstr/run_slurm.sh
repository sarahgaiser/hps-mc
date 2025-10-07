#!/bin/sh

export JOBDIR=/sdf/home/s/sgaiser/src/hps-mc/prod/slac/mcprod_2021/tritrig/overlay_to_hpstr
export RUNDIR=/sdf/data/hps/physics2021/run/prod/tritrig/overlay/ttb_rerecon

#hps-mc-batch slurm -o -r 1:750 -E /sdf/home/s/sgaiser/src/hps-mc/install/bin/hps-mc-env.sh -W 12 -q milano -A HPS:hps-prod -d $RUNDIR  -c $JOBDIR/.hpsmc -l $RUNDIR/logs signal_pulser_overlay_to_recon $JOBDIR/jobs_14272.json 

hps-mc-batch slurm -o -r 1:50 -E /sdf/home/s/sgaiser/src/hps-mc/install/bin/hps-mc-env.sh -W 2 -q milano -A HPS:hps-prod -d $RUNDIR -c $JOBDIR/.hpsmc -l $RUNDIR/logs readout_recon $JOBDIR/jobs_recon.json

#hps-mc-batch slurm -o -r 1:125 -E /sdf/home/s/sgaiser/src/hps-mc/install/bin/hps-mc-env.sh -W 3 -q milano -A HPS:hps-prod -d $RUNDIR -c $JOBDIR/.hpsmc -l $RUNDIR/logs hpstr $JOBDIR/jobs_hpstr.json
