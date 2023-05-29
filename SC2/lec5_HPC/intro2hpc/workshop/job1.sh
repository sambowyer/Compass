#!/bin/bash
#
#
#SBATCH --partition=test
#SBATCH --account=MATH021322


# Change into working directory
cd ~/workshop

# Execute code
/bin/hostname

# Pause to give us time to see the job
sleep 60

