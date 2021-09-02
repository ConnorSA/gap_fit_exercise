#!/bin/bash

#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=48
#SBATCH --mem-per-cpu=3700
#SBATCH --time=01:00:00

module purge
module load GCC/10.3.0 #make sure these modules are the same as what I used to compile QUIP
module load OpenBLAS/0.3.15
ulimit -s unlimited


srun ./quip atoms_filename=test_data.xyz param_filename=TiAl.xml e f | grep "^AT" | colrm 1 3 > TiAl_results_test.xyz 
