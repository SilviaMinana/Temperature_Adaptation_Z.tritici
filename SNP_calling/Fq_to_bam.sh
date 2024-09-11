#!/bin/bash

# This script is used to go from fastq files to the alignment in a sorted bam.
# The array is done on the samples.
# It can be used as follows: sbatch --array=1-10%2 --mem-per-cpu=6G --time=10:00:00 ./Fq_to_bam.sh ../Directories_and_files.txt ../Nikhil_pop.txt
# The first file given to the script contains the names of the directories and files such as the reference genome file path.
# The second file is the sample list, a file with two space-separated columm. 
# The first one contains the name of the sample as it should appear in the vcf and file names.
# The second column contains the read prefix. 

source $1 
sample_list=$2 


head $sample_list

# Define needed variables
# -----------------------
IDX=$SLURM_ARRAY_TASK_ID
echo ${IDX}
sample=$(sed -n ${IDX}p < ${sample_list} | cut -f 1 -d " ")
read_name=$(sed -n ${IDX}p < ${sample_list} | cut -f 2 -d " ")


# Load modules
# ------------
module load gcc/8.2.0 bwa/0.7.17 samtools/1.10  trimmomatic/0.35           


# Trimming
# --------
trimmomatic PE -threads 2\
     ${raw_dir}${read_name}_1.fq.gz\
     ${raw_dir}${read_name}_2.fq.gz\
     ${trimdir}${sample}_R1_P.fq.gz\
     ${trimdir}${sample}_R1_U.fq.gz\
     ${trimdir}${sample}_R2_P.fq.gz\
     ${trimdir}${sample}_R2_U.fq.gz\
     ILLUMINACLIP:${adapters}:2:28:10 LEADING:28 SLIDINGWINDOW:4:28 AVGQUAL:28 MINLEN:50

   rm ${trimdir}${sample}_R2_U.fq.gz 
   rm ${trimdir}${sample}_R1_U.fq.gz


# Mapping
# -------


bwa mem \
  ${refgenome} \
  ${trimdir}${sample}_R1_P.fq.gz \
  ${trimdir}${sample}_R2_P.fq.gz \
  > ${bamdir}${sample}.sam

samtools view -b ${bamdir}${sample}.sam > ${bamdir}${sample}.bam 
samtools sort ${bamdir}${sample}.bam -o ${bamdir}${sample}_sorted.bam
samtools index ${bamdir}${sample}_sorted.bam

if [[ -s ${bamdir}${sample}_sorted.bam ]] ;
 then
   rm ${bamdir}${sample}.sam 
   rm ${bamdir}${sample}.bam
fi

