#!/bin/sh

export JOBDIR=/sdf/home/s/sgaiser/src/hps-mc/prod/slac/mcprod_2021/wab/overlay_to_hpstr
export RUNDIR=/sdf/data/hps/physics2021/run/prod/wab/overlay/14272

hps-mc-batch slurm -o -r 1:500 -E /sdf/home/s/sgaiser/src/hps-mc/install/bin/hps-mc-env.sh -W 12 -q milano -A HPS:hps-prod -d $RUNDIR  -c $JOBDIR/.hpsmc -l $RUNDIR/logs signal_pulser_overlay_to_recon $JOBDIR/jobs_14272.json 

#hps-mc-batch slurm -o -r 1:10 -E /sdf/home/s/sgaiser/src/hps-mc/install/bin/hps-mc-env.sh -W 2 -q milano -A HPS:hps-prod -d $RUNDIR -c $JOBDIR/.hpsmc -l /sdf/data/hps/physics2021/mc/readout/tritrig_pulser/pass_v8/logs readout_recon $JOBDIR/jobs_recon.json
