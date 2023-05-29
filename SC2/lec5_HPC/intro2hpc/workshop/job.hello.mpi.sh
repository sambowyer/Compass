#!/bin/bash

#SBATCH --partition test
#SBATCH --nodes=2
#SBATCH --ntasks-per-node=8
#SBATCH --cpus-per-task=1
#SBATCH --time=0:0:10
#SBATCH --mem-per-cpu=100M

export EXE=${HOME}/workshop/hello.mpi

#Change to the working directory
cd "${SLURM_SUBMIT_DIR}"

#Add the module

#Run the command
srun -n $SLURM_NTASKS --cpu-bind=cores --mpi=pmi2 ${EXE}
