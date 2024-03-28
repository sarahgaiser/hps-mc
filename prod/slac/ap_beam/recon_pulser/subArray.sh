#!/usr/bin/scl enable devtoolset-8 -- /bin/bash
#SBATCH --ntasks=1
#SBATCH --time=12:00:00
#SBATCH --mem=1500M
#SBATCH --array=19-20
#SBATCH --partition=shared

source $HPSMC/install/bin/hps-mc-env.sh
export LD_LIBRARY_PATH=/sdf/group/hps/users/bravo/src/gsl-2.6/install/lib:$LD_LIBRARY_PATH

export FIRST_ID=0
export JOB_ID=$(($SLURM_ARRAY_TASK_ID+$FIRST_ID))
export JOBDIR=$HPSMC/prod/slac/ap_beam/recon_pulser
export RUNDIR=$SCRATCH/ap_beam/recon_pulser/$JOB_ID

mkdir -p $RUNDIR
cd $RUNDIR

/bin/python3 $HPSMC_DIR/lib/python/hpsmc/job.py run -d $RUNDIR -c $JOBDIR/.hpsmc -i ${JOB_ID} readout_recon $JOBDIR/jobs.json > $RUNDIR/../logs/job.${JOB_ID}.log

#SBATCH --output=/dev/null
# HPSMC points to hps-mc directory. You might need to set this variable before running this script.
