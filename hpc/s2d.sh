#!/bin/bash
#SBATCH --time=24:00:00
#SBATCH --nodes=1
#SBATCH --cpus-per-task=38
#SBATCH --job-name=mlr.stats2data.R
#SBATCH --mem=50G

module purge
module load R/4.2.1-foss-2022a

Rscript /home4/p310779/stats2data-publications/simulation_study.R