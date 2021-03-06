



in example_dir_hetsys are:
gap_fit			: A symbolic link to the gap_fit program. This will need to be relinked to your build! This is inside ~/QUIP/build/linux_x86_64_gfortran/gap_fit     NOTE: if you used the pip installation route, you can instead call gap_fit without the "./" prefix - this is also applied to the quip program.  
jobqtest.sh  		: A job to run quip on the test atoms. Spits out predictions of a GAP potential for those configs.
jobqtrain.sh  		: A job to run quip on the train atoms. spits out the predictions of the GAP.
job.sh  		: This job runs the gap_fit program and contains all the hyperparameters used.
original_data.xyz	: Original data if you want to make your own splits.
quip  			: A symbolic link to the quip program. This will need to be relinked to your build! e.g. ~/QUIP/build/linux_x86_64_gfortran/quip
test_data.xyz 		: A 90% split of the original data.		
train_data.xyz		: A 10% split of the original data. smaller train splits = quicker.



IMPORTANT: as you are using programs you have compiled, you will want 
to make note of any extra modules you loaded beforehand to compile
them. Make sure that the header in job.sh, jobqtrain.sh and
jobqtest.sh have the corresponding modules loaded. If in doubt
Try to compile QUIP with the modules listed in job.sh, otherwise
make the needed changes in the job files.

to re-make a symbolic link:

ln -s /PATH/TO/PROGRAM/program_name program_name

ON A HETMATHSYS NODE:
you may run a GAP fit by simply executing the job.sh inside the  example_dir_hetsys directory:
./job.sh
same for the other .sh


AVON/HPC CLUSTER:
example_dir_avon is for use on the Avon cluster.
Here the difference is that you run job.sh by
sbatch job.sh
same with the other .sh



Your job will be train multiple GAPs using the same parameters each time and to then calculate the Bulk modulus (error bars and mean can be found for each potential, giving the error arising from the different sparse points sampled). This can be done by following the "run_testing_framework" jupyter notebook. 