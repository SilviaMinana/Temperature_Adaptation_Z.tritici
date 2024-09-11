#!/bin/bash

#Create Fst files comparison of Populations. 

file="Populationslist.txt"

while IFS= read -r line; do
    vcftools --gzvcf ./mafmiss.recode.vcf.gz --haploid --weir-fst-pop Annaba_pop_samples.txt --weir-fst-pop ./Annaba/"${line}.txt" --out "Annaba_vs_${line}_populationsfst"
done < "$file"
