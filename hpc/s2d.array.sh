#!/bin/bash
#SBATCH --time=12:00:00
#SBATCH --nodes=1
#SBATCH --cpus-per-task=38
#SBATCH --job-name=aov.batch.R
#SBATCH --mem=30G
#SBATCH --array=1-100

module purge
module load R/4.2.1-foss-2022a

Rscript /home4/p310779/stats2data-publications/hpc/batch${SLURM_ARRAY_TASK_ID}.R