#!/bin/bash
#SBATCH --account=neuroendo
#SBATCH --job-name=fmriprep
#SBATCH --mail-type=BEGIN,END,FAIL,TIME_LIMIT_50,TIME_LIMIT_80,TIME_LIMIT_90
#SBATCH --mail-user=leb87
#SBATCH --partition=basic
#SBATCH --nodes=1
#SBATCH --chdir=/space/neuroendo/3/users/edcrp/derivatives/fmriprep_taste
#SBATCH --output=sbatch_output-%j.out
#SBATCH --error=sbatch_error-%A_%a.out
#SBATCH --ntasks-per-node=5
#SBATCH --mem=300G
#SBATCH --time=6-00:00:00 
#SBATCH --cpus-per-task=4
#SBATCH --array=1-113%5
 
subj=$( sed -n -E "$((${SLURM_ARRAY_TASK_ID} + 1))s/sub-(\S*)\>.*/\1/gp" /space/neuroendo/3/users/edcrp/nifti/1260_BIDS_taste_avery/participants.tsv )

singularity run \
--bind /space/neuroendo/3/users/edcrp/:/space/neuroendo/3/users/edcrp/ \
/space/neuroendo/3/users/edcrp/fmriprep-21.0.0.simg \
/space/neuroendo/3/users/edcrp/nifti/1260_BIDS_taste_avery \
/space/neuroendo/3/users/edcrp/derivatives/fmriprep_taste \
participant --participant-label $subj -w /space/neuroendo/3/users/edcrp/work --fs-no-reconall --use-syn-sdc \
--fs-license-file /space/neuroendo/3/users/edcrp/license.txt
