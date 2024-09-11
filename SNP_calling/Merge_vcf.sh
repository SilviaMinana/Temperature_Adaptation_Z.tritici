#!/bin/bash

#This script takes quality filtered vcf files per chromosomes.
#It concatenate all the vcf files in one, and filters on AB.
#It also estimates different per samples stats (depth, NA and IBS).

source $1
VCFBasename=$2

# Load modules
# ------------
module load gcc/8.2.0 bcftools/1.6



#  ------------------------------------
#|  Gathering files and filtering on AB |
#  ------------------------------------

# Get all variants in one file
bcftools concat \
  ${vcfdir}${VCFBasename}.1.filtered.clean.vcf.gz \
  ${vcfdir}${VCFBasename}.2.filtered.clean.vcf.gz \
  ${vcfdir}${VCFBasename}.3.filtered.clean.vcf.gz \
  ${vcfdir}${VCFBasename}.4.filtered.clean.vcf.gz \
  ${vcfdir}${VCFBasename}.5.filtered.clean.vcf.gz \
  ${vcfdir}${VCFBasename}.6.filtered.clean.vcf.gz \
  ${vcfdir}${VCFBasename}.7.filtered.clean.vcf.gz \
  ${vcfdir}${VCFBasename}.8.filtered.clean.vcf.gz \
  ${vcfdir}${VCFBasename}.9.filtered.clean.vcf.gz \
  ${vcfdir}${VCFBasename}.10.filtered.clean.vcf.gz \
  ${vcfdir}${VCFBasename}.11.filtered.clean.vcf.gz \
  ${vcfdir}${VCFBasename}.12.filtered.clean.vcf.gz \
  ${vcfdir}${VCFBasename}.13.filtered.clean.vcf.gz \
  ${vcfdir}${VCFBasename}.14.filtered.clean.vcf.gz \
  ${vcfdir}${VCFBasename}.15.filtered.clean.vcf.gz \
  ${vcfdir}${VCFBasename}.16.filtered.clean.vcf.gz \
  ${vcfdir}${VCFBasename}.17.filtered.clean.vcf.gz \
  ${vcfdir}${VCFBasename}.18.filtered.clean.vcf.gz \
  ${vcfdir}${VCFBasename}.19.filtered.clean.vcf.gz \
  ${vcfdir}${VCFBasename}.20.filtered.clean.vcf.gz \
  ${vcfdir}${VCFBasename}.21.filtered.clean.vcf.gz \
  ${vcfdir}${VCFBasename}.22.filtered.clean.vcf.gz \
  -o ${vcfdir}${VCFBasename}.ALL.filtered.clean.vcf.gz \
  --output-type  z 
