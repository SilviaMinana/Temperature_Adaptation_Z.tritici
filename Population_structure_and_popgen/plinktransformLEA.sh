#!/bin/bash
#Script to create the plink file to use with package LEA in R that contains the sNMF admixture software

module load vcftools/0.1.16

vcftools --vcf thinnedplusmaf.recode.vcf \
  --extract-FORMAT-info GT \
  --out thinnedplusmaf

cat  thinnedplusmaf.GT.FORMAT | cut -f 3- >thinnedplusmaf.GT.FORMAT2
cat  thinnedplusmaf.GT.FORMAT | cut -f 1,2 > thinnedplusmaf.GT.FORMAT.pos
head -n1 thinnedplusmaf.GT.FORMAT2 | sed "s/\t/\n/g" > thinnedplusmaf.ind
sed "s/\t//g"  thinnedplusmaf.GT.FORMAT2 | tail -n +2 > thinnedplusmaf.geno
