#!/bin/bash
#
#

#SBATCH --partition=test
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --time=0:02:00
#SBATCH --mem-per-cpu=100M
#SBATCH --array 1-5
#SBATCH --account=[PROJECT_CODE]

module load lang/python/anaconda

# Change into working directory
cd ${SLURM_SUBMIT_DIR}

# Do some stuff
echo JOB ID: ${SLURM_JOBID}
echo SLURM ARRAY ID: ${SLURM_ARRAY_TASK_ID}
echo Working Directory: $(pwd)

echo Start Time: $(date)
# Execute code
python script.py ${SLURM_ARRAY_TASK_ID}

echo End Time: $(date)

sleep 10

