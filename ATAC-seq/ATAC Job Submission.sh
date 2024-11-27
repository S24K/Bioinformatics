#!/bin/bash
#SBATCH -J ATAC_JOB_1           # Job name
#SBATCH -N 1                    # Number of nodes
#SBATCH -c 1                    # Number of cores
#SBATCH -p all                  # Partition (queue) to submit
#SBATCH --time=5-00:00:00       # Runtime in days-hh:mm:ss
#SBATCH --mem=15g               # Memory required
#SBATCH -e ATAC_JOB-2.err       # File to write errors to
#SBATCH --mail-type=END,FAIL    # Notify when the job ends or fails (optional)
#SBATCH --mail-user=firstnamelastname@gmail.com  # Email to notify (optional)

#Access Folder
cd /path/to/folder

#Load the ENCODE pipeline.
module load atac-seq-pipeline/2.2.2

caper hpc submit $pipeline_home/atac.wdl -i /location/to/.json --leader-job-name ATAC_Job --conda --womtool $pipeline_home/womtool-86.jar --cromwell \
$pipeline_home/cromwell-86.jar --local-loc-dir ./ --backend slurm \
--slurm-account epigenomics --slurm-partition himem
