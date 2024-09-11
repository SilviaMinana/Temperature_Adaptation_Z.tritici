#!/bin/bash

#Create tailored per Admixture Clusters vcf files
#Run like this: sbatch --array=1-100%2 --mem-per-cpu=4G --time=10:00:00 ./Createtailoredperadmclustervcfs.sh ./Adm_Clusterslist.txt

sample_list=$1


# Define needed variables
# -----------------------
IDX=${SLURM_ARRAY_TASK_ID}
sample=$(sed -n ${IDX}p  ${sample_list})


module load gcc/8.2.0 bcftools/1.6

bcftools view -S ${sample} -Oz -o  ${sample}.new.vcf.gz mafmiss.recode.vcf.gz

