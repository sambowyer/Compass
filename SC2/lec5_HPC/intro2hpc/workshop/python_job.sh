#!/bin/bash
#
#SBATCH --partition=test
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --time=0:0:10
#SBATCH --mem=100M
#SBATCH --account=MATH021322
#SBATCH --array=1-5

module load lang/python/anaconda

# Change into working directory
cd "${SLURM_SUBMIT_DIR}"

# Execute code
python script.py ${SLURM_ARRAY_TASK_ID}
