#!/bin/bash

# This script takes the sorted bam file and proceeds to remove PCR duplicates and add the sample name as read group.
# It can be used as follows: sbatch --array=1-20%5 --mem-per-cpu=15G --time=10:00:00 ./Dedup_bam.sh ../Directories_and_files.txt ../Nikhil_pop.txt
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
module load gcc/8.2.0 samtools/1.10           
module load gcc/4.8.5  picard/2.25.7


# Picard process
# --------------
picard MarkDuplicates\
 INPUT=${bamdir}${sample}_sorted.bam \
 OUTPUT=${bamdir}${sample}_dedup.bam \
 M=${bamdir}${sample}_dup_metrics.txt REMOVE_DUPLICATES=true

picard AddOrReplaceReadGroups\
 INPUT=${bamdir}${sample}_dedup.bam \
 OUTPUT=${bamdir}${sample}_final.bam \
 RGID=${sample}\
 RGLB=lib1\
 RGPL=ILLUMINA\
 RGPU=unknown\
 RGSM=${sample}

samtools index ${bamdir}${sample}_final.bam

 
