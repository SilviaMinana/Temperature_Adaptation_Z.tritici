#!/bin/bash

#Create tailored per Populations vcf files


#Run like this: sbatch --array=1-30%2 --mem-per-cpu=4G --time=10:00:00 ./Createtailoredperpopulationvcfs.sh ./Populationslist.txt

sample_list=$1


# Define needed variables
# -----------------------
IDX=${SLURM_ARRAY_TASK_ID}
sample=$(sed -n ${IDX}p  ${sample_list})


module load gcc/8.2.0 bcftools/1.6

bcftools view -S ${sample}.txt -Oz -o  ${sample}.new.vcf.gz mafmiss.recode.vcf.gz

