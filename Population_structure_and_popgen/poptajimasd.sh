#!/bin/bash

#Create Tajima's D files per each Population and each Genetic Cluster. 




file="Populationslist.txt"

while IFS= read -r line; do
  vcftools --gzvcf ./Population_analysis/${line}.new.vcf.gz --haploid --TajimaD 10000 --out "${line}.tajimasd10kb"
done < "$file"

