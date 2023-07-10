
export HPSMC=/sdf/group/hps/users/sgaiser/src/hps-mc
export HPSMC_DIR=/sdf/group/hps/users/sgaiser/src/hps-mc/install

export JOBDIR=$HPSMC/prod/slac/beam/gen
export RUNDIR=$SCRATCH/beam/gen

hps-mc-batch slurm -o -q hps -r 1:500 -m 1500 -E $HPSMC_DIR/bin/hps-mc-env.sh -W 12 -d $RUNDIR -c $JOBDIR/.hpsmc -l $RUNDIR/logs beam_gen $JOBDIR/jobs.json

