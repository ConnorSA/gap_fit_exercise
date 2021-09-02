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

options="at_file="train_data.xyz" \
 gap={soap l_max=6 n_max=8 atom_sigma=0.5 zeta=4 \
 cutoff=6 cutoff_transition_width=0.5 central_weight=1.0 \
 n_sparse=400 delta=2.00 \
 covariance_type=dot_product sparse_method=cur_points} \
 default_sigma={0.002 0.2 0.2 0.0} energy_parameter_name=energy \
 force_parameter_name=force virial_parameter_name=virial sparse_jitter=1.0e-8 \
 e0={Ti:-1587.0085:Al:-107.1307} \
 do_copy_at_file=F sparse_separate_file=T \
 gp_file=TiAl.xml"


GAP_FIT=./gap_fit

export OMP_NUM_THREADS=$SLURM_CPUS_PER_TASK

srun ${GAP_FIT} ${options}
