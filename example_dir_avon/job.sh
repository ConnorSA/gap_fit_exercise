#!/bin/bash

module purge
module load GCC/8.3.0 #make sure these modules are the same as what was used to compile QUIP
module load OpenBLAS/0.3.7
ulimit -s unlimited

options="at_file="train_data.xyz" \
 gap={distance_Nb order=2 cutoff=3.5 n_sparse=100 covariance_type=ard_se \
 delta=1.0 theta_uniform=2.5 sparse_method=uniform compact_clusters=T \
 :\
 soap l_max=6 n_max=8 atom_sigma=0.5 zeta=4 \
 cutoff=6 cutoff_transition_width=0.5 central_weight=1.0 \
 n_sparse=2400 delta=0.05 \
 covariance_type=dot_product sparse_method=cur_points} \
 default_sigma={0.002 0.2 0.2 0.0} energy_parameter_name=energy force_parameter_name=force virial_parameter_name=virial sparse_jitter=1.0e-8 \
 e0={Ti:-1587.0085:Al:-107.1307} \
 do_copy_at_file=F sparse_separate_file=T \
 gp_file=TiAl.xml"


export OMP_NUM_THREADS=35
export OMP_STACKSIZE=1000m

#gap_fit ${options} # 
./gap_fit ${options}
