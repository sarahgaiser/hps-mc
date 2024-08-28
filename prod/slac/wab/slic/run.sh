#!/bin/bash
#SBATCH --ntasks=1
#SBATCH --time=24:00:00
#SBATCH --partition=shared
#SBATCH --job-name=examples

hps-mc-job run -d $PWD/scratch $PWD/wab_prep_and_slic_job.py job.json
