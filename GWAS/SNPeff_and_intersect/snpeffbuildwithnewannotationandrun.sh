#!/bin/bash


### The ztnew model was build in the following fashion:
########### Step 1: Configure a new genome in SnpEff's config file snpEff.config. Add genome entry to snpEff's configuration
########### Step 2: Build using gene annotations and reference sequences 
cd /path/to/snpEff
### The fasta file needs to be in this format: /path/to/snpEff/data/genomes/ztnew.fa which was produced by mv Zymoseptoria_tritici.MG2.dna.toplevel.mt+.fa ztnew.fa
### The annotation file was created like this 

### The 

java -jar snpEff.jar build -gff3 -v ztnew



### This is how I run the snpEff software with a -ud flag that specifies the upstream downstream interval length (in bases) and with the built model based on the new annotation from the file: z.tritici.IP0323.reannot.gff3

java -Xmx8g -jar snpEff.jar -ud 2800 -v ztnew Common_vcf.ALLv2.filtered.clean.vcf > Common_vcf.ALLv2.filtered.clean.ann.vcf


### Now the same script but adding extra information, which in this case is the bed file with the significant loci from the 10 Conditions phenotyping of the WWC:

java -Xmx8g -jar snpEff.jar -interval Significant_temperaturefdr0.1_loci_v1.bed -ud 2800 -v ztnew Common_vcf.ALLv2.filtered.clean.vcf > Common_vcf.ALLv2.filtered.clean.temperature.ann.vcf

### To filter the results I used:

grep "CUSTOM&Significant_temperaturefdr0" Common_vcf.ALLv2.filtered.clean.temperature.ann.vcf | cut -f -8 > alltemperaturevars_220823.txt

### Then I modified the alltemperaturevars_220823.txt and removed all columns except 8 and only chose the information in the "ANN" flag, even if I am unsure why it worked and did not use the growth_ratem2_22C pattern AT ALL!

cat alltemperaturevars_220823_mod1.csv | awk '{ sub(/.*ANN=/, ""); sub(/growth_ratem2_22C.*/, ""); print }' > alltemperaturevars_220823_mod3.csv

### Now I figured out a way to only separate the different fields in the document is manually: first change commas already present by points and then replace "|" with "," to make a csv. 


grep 'HIGH' Iamtrying.csv
