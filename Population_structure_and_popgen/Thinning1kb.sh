#!/bin/bash
 
# Thin the vcf file
 
# Load modules
# ------------

module load vcftools/0.1.14

vcftools --gzvcf ../03_snp_calling/Common_vcf.ALL.filtered.clean.vcf.gz --recode --min-alleles 2 --max-alleles 2 --max-missing 0.8 --thin 1000 --maf 0.05 --out thinnedplusmaf
