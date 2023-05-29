#!/bin/bash
#
#
#SBATCH --partition=test
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --time=0:0:10
#SBATCH --mem=100M

# Change into working directory
cd "${SLURM_SUBMIT_DIR}"

# Hello World program
./hello
