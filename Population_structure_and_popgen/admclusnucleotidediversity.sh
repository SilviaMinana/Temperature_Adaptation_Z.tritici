#!/bin/bash

#Create nucleotide diversity files per each Population and each Genetic Cluster. 




file="Adm_Clusterslist.txt"

while IFS= read -r line; do
  vcftools --gzvcf ./Adm_Cluster_analysis/${line}.new.vcf.gz --haploid --window-pi 10000 --out "${line}.nucleotidediversity"
done < "$file"

