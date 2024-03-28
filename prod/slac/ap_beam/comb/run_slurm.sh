


export HPSMC=/sdf/group/hps/users/sgaiser/src/hps-mc
export HPSMC_DIR=/sdf/group/hps/users/sgaiser/src/hps-mc/install

export JOBDIR=$HPSMC/prod/slac/ap_beam/comb
export RUNDIR=$SCRATCH/ap_beam/comb

hps-mc-batch slurm -o -q hps -r 61:100 -m 1500 -E $HPSMC_DIR/bin/hps-mc-env.sh -W 12 -d $RUNDIR -c $JOBDIR/.hpsmc -l $RUNDIR/logs ap_beam $JOBDIR/jobs.json

