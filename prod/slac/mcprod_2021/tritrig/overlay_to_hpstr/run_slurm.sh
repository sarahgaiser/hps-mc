#!/bin/sh

export JOBDIR=/sdf/home/s/sgaiser/src/hps-mc/prod/slac/mcprod_2021/tritrig/overlay_to_hpstr
export RUNDIR=/sdf/data/hps/physics2021/run/prod/tritrig/readout

hps-mc-batch slurm -o -r 1:10 -E /sdf/home/s/sgaiser/src/hps-mc/install/bin/hps-mc-env.sh -W 6 -q milano -A HPS:hps-prod -d $RUNDIR  -c $JOBDIR/.hpsmc -l /sdf/data/hps/physics2021/mc/readout/tritrig_pulser/pass_v7/logs signal_pulser_overlay_to_recon $JOBDIR/jobs.json 

