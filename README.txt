in example_dir are:
gap_fit			: A symbolic link to the gap_fit program. This will need to be relinked to your build! This is inside ~/QUIP/build/linux_x86_64_gfortran/gap_fit  
jobqtest.sh  		: A job to run quip on the test atoms. Spits out predictions of a GAP potential for those configs.
jobqtrain.sh  		: A job to run quip on the train atoms. spits out the predictions of the GAP.
job.sh  		: This job runs the gap_fit program and contains all the hyperparameters used.
original_data.xyz	: Original data if you want to make your own splits.
quip  			: A symbolic link to the quip program. This will need to be relinked to your build! e.g. ~/QUIP/build/linux_x86_64_gfortran/quip
test_data.xyz 		: A 90% split of the original data.		
train_data.xyz		: A 10% split of the original data. smaller train splits = quicker.
