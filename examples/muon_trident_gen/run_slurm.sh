#!/bin/sh

export JOBDIR=/sdf/home/s/sgaiser/src/hps-mc/examples/muon_trident_gen
export RUNDIR=/sdf/data/hps/physics2021/run/prod/tritrig/gen

hps-mc-batch slurm -o -r 1:3 --env $JOBDIR/setup.sh -W 3 -q milano -A HPS:hps-prod -d $RUNDIR  -c $JOBDIR/.hpsmc -l $JOBDIR/logs muon_bkg_gen $JOBDIR/jobs.json 

