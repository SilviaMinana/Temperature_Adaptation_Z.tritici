#!/bin/bash

#Create Fst files comparison of Genetic Clusters. 


vcftools --gzvcf ./mafmiss.recode.vcf.gz --haploid --weir-fst-pop Argentina_Uruguay_samples.txt --weir-fst-pop Australia_samples.txt --weir-fst-pop Canada_samples.txt --weir-fst-pop Chile_samples.txt --weir-fst-pop Europe_samples.txt --weir-fst-pop Middle_East_samples.txt --weir-fst-pop Other_samples.txt --weir-fst-pop Tunisia_samples.txt --weir-fst-pop USA_samples.txt --out admclustersfst