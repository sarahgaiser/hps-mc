#!/bin/bash
#SBATCH --ntasks=1
#SBATCH --time=24:00:00
#SBATCH --mem=1500M
#SBATCH --array=1-50
#SBATCH --account=HPS:hps-prod
#SBATCH --output=/dev/null

source $HPSMC/install/bin/hps-mc-env.sh
export LD_LIBRARY_PATH=/sdf/group/hps/users/bravo/src/gsl-2.6/install/lib:$LD_LIBRARY_PATH

export FIRST_ID=950
export JOB_ID=$(($SLURM_ARRAY_TASK_ID+$FIRST_ID))
export JOBDIR=$HPSMC/prod/slac/wab/slic
export RUNDIR=/fs/ddn/sdf/scratch/s/sgaiser/wab/slic/$JOB_ID

mkdir -p $RUNDIR
cd $RUNDIR

/bin/python3 $HPSMC_DIR/lib/python/hpsmc/job.py run -d $RUNDIR -c $JOBDIR/.hpsmc -i ${JOB_ID} wab_prep_and_slic $JOBDIR/jobs.json > $RUNDIR/../logs/job.${JOB_ID}.log

# HPSMC points to hps-mc directory. You might need to set this variable before running this script.
#SBATCH --output=/dev/null
