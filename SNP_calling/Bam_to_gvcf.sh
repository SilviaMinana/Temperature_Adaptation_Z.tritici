#!/bin/bash

# This script takes a sorted and deduplicated bam files and obtains a g.vcf from gatk.
# It can be used as follows : sbatch --array=1-20%5 --mem-per-cpu=2G --time=20:00:00 ./Bam_to_gvcf.sh ../Directories_and_files.txt ../Nikhil_pop.txt
# The first file given to the script contains the names of the directories and files such as the reference genome file path. 
# The second is a space separated two-column files with the sample and file name in the first column.

source $1 
sample_list=$2


# Define needed variables
# -----------------------
IDX=${SLURM_ARRAY_TASK_ID}
sample=$(sed -n ${IDX}p < ${sample_list} | cut -f 1 -d " ")
read_name=$(sed -n ${IDX}p < ${sample_list} | cut -f 2 -d " ")


# Load modules
# ------------
 module load gdc java/1.8.0_31 gatk/4.1.2.0
 

# Variant calling
# ---------------
gatk --java-options "-Xmx2G" \
  HaplotypeCaller \
  -R ${refgenome} \
  -ploidy 1 \
  -I ${bamdir}${sample}_final.bam \
  -ERC GVCF \
  -O ${vcfdir}${sample}.g.vcf.gz

