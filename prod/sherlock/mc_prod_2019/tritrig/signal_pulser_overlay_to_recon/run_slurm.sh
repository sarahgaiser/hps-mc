#!/bin/sh
export JOBDIR=/home/groups/laurenat/majd/HPS/hps-mc/prod/sherlock/mc_prod_2019/tritrig/signal_pulser_overlay_to_recon
export RUNDIR=/scratch/users/mghrear/tritrig_pulser

hps-mc-batch slurm -o -r 1:5 -E /home/groups/laurenat/majd/HPS/hps-mc/install/bin/hps-mc-env.sh -W 14 -m 5000 -q normal -d $RUNDIR  -c $JOBDIR/.hpsmc signal_pulser_overlay_to_recon $JOBDIR/jobs.json 

