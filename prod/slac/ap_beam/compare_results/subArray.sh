#!/bin/bash
#SBATCH --ntasks=1
#SBATCH --time=4:00:00
#SBATCH --mem=1500M
#SBATCH --array=1
#SBATCH --account=HPS:hps-prod

root -l /sdf/home/s/sgaiser/src/hps-mc/prod/slac/ap_beam/compare_results/GetSameEvents.C
