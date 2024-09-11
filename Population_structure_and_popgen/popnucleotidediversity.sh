#!/bin/bash

#Create nucleotide diversity files per each Population and each Genetic Cluster. 




file="Populationslist.txt"

while IFS= read -r line; do
  vcftools --gzvcf ./Population_analysis/${line}.new.vcf.gz --haploid --window-pi 10000 --out "${line}.nucleotidediversity"
done < "$file"

