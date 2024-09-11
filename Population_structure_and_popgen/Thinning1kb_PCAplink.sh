#!/bin/bash
 
# Thin the vcf file
 
# Load modules
# ------------

module load vcftools/0.1.14

vcftools --gzvcf ../03_snp_calling/Common_vcf.ALL.filtered.clean.vcf.gz --recode --min-alleles 2 --max-alleles 2 --max-missing 0.8 --thin 1000 --maf 0.05 --out thinnedplusmaf


#vcftools --missing-indv --vcf /cluster/scratch/afeurtey/thinnedplusmaf.missing20.recode.vcf
#less out.imiss | sort -k 5 #Manually identify the samples that have tons of missing data (actually this probably should be done before filtering on SNP missing data, but whatever for now)
#vcftools --vcf thinnedplusmaf.recode.vcf  --max-missing 0.8 --recode --remove-indels --remove-indv ST90ORE_a12_3B_13 --remove-indv Tunisia_2008_ST08TN_33_1_2  --remove-indv Texas_1994_ST94TX_PF4a_1 --remove-indv ST92YE_1 --out thinnedplusmaf.missing20

# Create PCA 
#./plink2 --vcf ./thinnedplusmaf.missing20.recode.vcf  --pca  --double-id --allow-extra-chr
