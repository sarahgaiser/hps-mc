
export HPSMC=/sdf/group/hps/users/sgaiser/src/hps-mc
export HPSMC_DIR=/sdf/group/hps/users/sgaiser/src/hps-mc/install

export JOBDIR=$HPSMC/prod/slac/ap/gen
export RUNDIR=$SCRATCH/ap/gen/

hps-mc-batch slurm -o -q hps -r 1:100 -m 1500 -E $HPSMC_DIR/bin/hps-mc-env.sh -W 12 -d $RUNDIR -c $JOBDIR/.hpsmc -l $RUNDIR/logs ap_gen $JOBDIR/jobs.json

