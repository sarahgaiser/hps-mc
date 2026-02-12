#!/bin/sh

export JOBDIR=/sdf/home/s/sgaiser/src/hps-mc/prod/slac/mcprod_2021/ap/overlay_to_hpstr
export RUNDIR=/sdf/data/hps/physics2021/run/prod/ap180/overlay/

hps-mc-batch slurm -o -r 1:200 -E /sdf/home/s/sgaiser/src/hps-mc/install/bin/hps-mc-env.sh -W 6 -m 8000 -q roma -A HPS:hps-prod -d $RUNDIR  -c $JOBDIR/.hpsmc -l $RUNDIR/logs signal_pulser_overlay_to_recon $JOBDIR/jobs_ap180.json 

#hps-mc-batch slurm -o -r 1:10 -E /sdf/home/s/sgaiser/src/hps-mc/install/bin/hps-mc-env.sh -W 2 -q milano -A HPS:hps-prod -d $RUNDIR -c $JOBDIR/.hpsmc -l /sdf/data/hps/physics2021/mc/readout/tritrig_pulser/pass_v8/logs readout_recon $JOBDIR/jobs_recon.json

#hps-mc-batch slurm -o -r 1:250 -E /sdf/home/s/sgaiser/src/hps-mc/install/bin/hps-mc-env.sh -W 3 -q milano -A HPS:hps-prod -d $RUNDIR -c $JOBDIR/.hpsmc -l $RUNDIR/logs hpstr $JOBDIR/jobs_hpstr.json
