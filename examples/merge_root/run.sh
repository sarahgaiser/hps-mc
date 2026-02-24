#!/usr/bin/scl enable devtoolset-8 -- /bin/bash
#SBATCH --ntasks=1
#SBATCH --time=24:00:00
#SBATCH --partition=shared
#SBATCH --job-name=examples
#hps-mc-job run -d $PWD/scratch root_merge job.json

timestamp=`date +"%Y-%m-%d_%H-%M-%S"`

hps-mc-batch slurm -o -A hps:hps-prod -m 8000 -q milano -W 6 \
        -E /sdf/data/hps/users/mgignac/software/dev/hps-mc/examples/merge_root/setup_env.sh \
        -d /sdf/scratch/hps/mgignac/merged/run/$timestamp \
        -l /sdf/scratch/hps/mgignac/merged/logs/$timestamp/ \
        root_merge merge_jobs_jobs.json
