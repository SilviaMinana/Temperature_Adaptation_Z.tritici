#!/bin/bash

#Here the array is per chromosome and not per sample 
#sbatch --array=1-21 --mem-per-cpu=8G --time=20:00:00 ./Combine_gvcf.sh ../Directories_and_files.txt
# The file myvcflist is a text file containing one column with the each line giving the path to a g.vcf file. The extension is .list

source $1 
myvcflist=$2
#IDX=${LSB_JOBINDEX}
IDX=${SLURM_ARRAY_TASK_ID}

# Load modules
# ------------
 module load gdc java/1.8.0_31 gatk/4.1.2.0


if [ ${IDX} == 22 ] ; then 
 
	gatk --java-options "-Xmx8G" \
  		CombineGVCFs \
 		-R ${refgenome} \
  		-L mt \
  		-V ${myvcflist} \
  		-O ${vcfdir}Common_vcf.${IDX}.g.vcf \
  		--tmp-dir ${vcfdir}

	gatk --java-options "-Xmx8G" GenotypeGVCFs \
		-R ${refgenome} \
  		-V ${vcfdir}Common_vcf.${IDX}.g.vcf \
  		-O ${vcfdir}Common_vcf.${IDX}.vcf.gz \
  		--max-alternate-alleles 3



else 

        gatk --java-options "-Xmx8G" \
                CombineGVCFs \
                -R ${refgenome} \
                -L ${IDX} \
                -V ${myvcflist} \
                -O ${vcfdir}Common_vcf.${IDX}.g.vcf \
                --tmp-dir ${vcfdir}

        gatk --java-options "-Xmx8G" GenotypeGVCFs \
                -L ${IDX} \
                -R ${refgenome} \
                -V ${vcfdir}Common_vcf.${IDX}.g.vcf \
                -O ${vcfdir}Common_vcf.${IDX}.vcf.gz \
                --max-alternate-alleles 3

fi
