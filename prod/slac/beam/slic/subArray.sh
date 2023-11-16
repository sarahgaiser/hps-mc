#!/usr/bin/scl enable devtoolset-8 -- /bin/bash
#SBATCH --ntasks=1
#SBATCH --time=24:00:00
#SBATCH --mem=1500M
#SBATCH --array=451-500
#SBATCH --partition=shared
#SBATCH --output=/dev/null

source $HPSMC/install/bin/hps-mc-env.sh
export LD_LIBRARY_PATH=/sdf/group/hps/users/bravo/src/gsl-2.6/install/lib:$LD_LIBRARY_PATH
export FIRST_ID=0
export JOB_ID=$(($SLURM_ARRAY_TASK_ID+$FIRST_ID))
export JOBDIR=$HPSMC/prod/slac/beam/slic
export RUNDIR=$SCRATCH/beam/slic/$JOB_ID

mkdir -p $RUNDIR
cd $RUNDIR

/bin/python3 $HPSMC_DIR/lib/python/hpsmc/job.py run -l $RUNDIR/../logs/job.${JOB_ID}.log -d $RUNDIR -c $JOBDIR/.hpsmc -i ${JOB_ID} beam_prep_and_slic $JOBDIR/jobs.json > $RUNDIR/../logs/job.${JOB_ID}.log

#SBATCH --output=/dev/null
# HPSMC points to hps-mc directory. You might need to set this variable before running this script.
