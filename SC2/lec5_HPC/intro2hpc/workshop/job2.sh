#!/bin/bash
#
#SBATCH --partition=test
#SBATCH --account=MATH021322


# Change into working directory
cd "${SLURM_SUBMIT_DIR}"

# Execute code
/bin/hostname

# Pause to give us time to see the job
sleep 60

#Print the directory we are in
pwd
