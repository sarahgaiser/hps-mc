
export HPSMC=/sdf/group/hps/users/sgaiser/src/hps-mc
export HPSMC_DIR=/sdf/group/hps/users/sgaiser/src/hps-mc/install

export JOBDIR=$HPSMC/prod/slac/beam/gen/3pt74_20umW
export RUNDIR=$SCRATCH/beam/gen/20umW

hps-mc-batch slurm -o -q hps -r 70:75 -m 1500 -E $HPSMC_DIR/bin/hps-mc-env.sh -W 12 -d $RUNDIR -c $JOBDIR/.hpsmc -l $RUNDIR/logs beam_gen $JOBDIR/jobs.json

