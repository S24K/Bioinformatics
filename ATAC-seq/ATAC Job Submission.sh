#!/bin/bash
#SBATCH -J ATAC_JOB_1           # Job name
#SBATCH -N 1                    # Number of nodes
#SBATCH -c 1                    # Number of cores
#SBATCH -p all                  # Partition (queue) to submit
#SBATCH --time=5-00:00:00       # Runtime in days-hh:mm:ss
#SBATCH --mem=15g               # Memory required
#SBATCH -e ATAC_JOB-2.err       # File to write errors to
#SBATCH --mail-type=END,FAIL    # Notify when the job ends or fails (optional)
#SBATCH --mail-user=souren.haghbin@uhn.ca  # Email to notify (optional)

#Access Folder
cd /cluster/projects/epigenomics/Souren/fast_q/POP_170

#Load the ENCODE pipeline.
module load atac-seq-pipeline/2.2.2

caper hpc submit $pipeline_home/atac.wdl -i /cluster/home/t134491uhn/job_submission/input_1.json --leader-job-name ATAC_Job --conda --womtool $pipeline_home/womtool-86.jar --cromwell \
$pipeline_home/cromwell-86.jar --local-loc-dir ./ --backend slurm \
--slurm-account epigenomics --slurm-partition himem
