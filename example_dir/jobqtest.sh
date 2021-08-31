#!/bin/bash

###SBATCH --nodes=1
##SBATCH --ntasks-per-node=1
##SBATCH --cpus-per-task=1
##SBATCH --time=00:30:00

module purge
module load GCC/8.3.0
module load OpenBLAS/0.3.7
# module purge
# module load intel  impi imkl
ulimit -s unlimited

# atoms_filename is a set of points to get quip to generate energy and forces for (e and f)
# param_filename is the potential that we have made using the training set .xyz, this is done using the gap_fit job
# spit out results to some .xyz file

filename="test_data.xyz"

./quip atoms_filename=${filename} param_filename=TiAl.xml e f | grep "^AT" | colrm 1 3 > TiAl_results_test.xyz 
