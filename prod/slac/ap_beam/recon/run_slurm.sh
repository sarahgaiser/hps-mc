
export HPSMC=/sdf/group/hps/users/sgaiser/src/hps-mc
export HPSMC_DIR=/sdf/group/hps/users/sgaiser/src/hps-mc/install

export JOBDIR=$HPSMC/prod/slac/tritrig_beam/recon
export RUNDIR=$SCRATCH/tritrig_beam/

hps-mc-batch slurm -o -q hps -r 0:50 -m 1500 -E $HPSMC_DIR/bin/hps-mc-env.sh -W 12 -d $RUNDIR -c $JOBDIR/.hpsmc -l $RUNDIR/logs readout_recon $JOBDIR/jobs.json

