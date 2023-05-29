#!/bin/bash
#
#
#SBATCH --partition=test
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --time=0:02:0
#SBATCH --mem=100M
#SBATCH --account=[PROJECT_CODE]

# Define executable
export EXE=/bin/hostname

# Change into working directory
cd "${SLURM_SUBMIT_DIR}"

# Execute code
${EXE}

# Do some stuff

echo JOB ID: "${SLURM_JOBID}"

echo Working Directory: $(pwd)

echo Start Time: $(date)

# Execute code
${EXE}

# Pause to give us time to see the job
sleep 10

echo End Time: $(date)