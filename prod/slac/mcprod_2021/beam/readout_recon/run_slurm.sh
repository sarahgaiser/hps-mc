#!/bin/sh

export JOBDIR=/sdf/home/s/sgaiser/src/hps-mc/prod/slac/mcprod_2021/beam/readout_recon
export RUNDIR=/sdf/data/hps/physics2021/run/prod/beam/readout

hps-mc-batch slurm -o -r 11:1000 -E /sdf/home/s/sgaiser/src/hps-mc/install/bin/hps-mc-env.sh -W 6 -m 6000 -q milano -A HPS:hps-prod -d $RUNDIR  -c $JOBDIR/.hpsmc -l $RUNDIR/logs recon $JOBDIR/jobs_recon.json 

