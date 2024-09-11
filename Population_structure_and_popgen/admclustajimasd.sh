#!/bin/bash

#Create Tajima's D files per each Population and each Genetic Cluster. 




file="Adm_Clusterslist.txt"

while IFS= read -r line; do
  vcftools --gzvcf ./Adm_Cluster_analysis/${line}.new.vcf.gz --haploid --TajimaD 10000 --out "${line}.tajimasd10kb"
done < "$file"

