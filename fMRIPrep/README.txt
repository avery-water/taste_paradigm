How to run a batch script on the MLSC computing cluster 

Resources:
	MLSC cluster info: https://it.martinos.org/mlsc-cluster/ 
	MLSC singularity info: https://it.martinos.org/using-singularity-on-the-mlsc-cluster/
	fMRIprep compute resource info: https://fmriprep.org/en/stable/faq.html 

Walkthrough: 
	1. Setup a slurm group account to assign jobs to when submitting to MLSC cluster (see MLSC cluster info resource linked above for specific intructions on how to do this).

	2. ssh to the MLSC cluster master node
		>> ssh -l username mlsc.nmr.mgh.harvard.edu 
	3. Verify you are in the slurm system 
		>> sshare -U -u $USER 
	4. Change into directory where the batch script you are running is located 
		>> cd /space/neuroendo/3/users/edcrp/taste_scripts
	5. Submit job (see MLSC cluster info resource linked above for specific instructions on how to do this, see fMRIprep compute resource info to determine what specifications are needed for your job submission).
		note: command below is specified for running the 1260 taste preprocessing
		>> bash
		>> PATH=$PWD:$PATH
		>> sbatch sbatch.sh
	6. Output log files (and error log files) for the job will populate here: /autofs/space/neuroendo_003/users/edcrp/derivatives/fmriprep_taste/. You can disconnect and the job will continue to run. 
	7. You will receive an email if the job fails or when it ends. When the job finishes, check /cluster/batch/username for any input/output that needs to be transferred after job is finished running.  
