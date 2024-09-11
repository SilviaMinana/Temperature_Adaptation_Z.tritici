# Temperature_Adaptation_Z.tritici

These are the scripts that I have written to study the thermal adaptation of *Zymoseptoria tritici* worldwide collection using around 400 strains. The paper has been submitted. I will update this readme once I have the link to the publication.
Some of my scripts were modified from previously existing scripts done by Alice Feurtey https://github.com/afeurtey/WW_PopGen. 

## GWAS

In this folder you can find the R Markdown scripts and their accompaning .html files were I analyzed the results from the pipeline *vcf2gwas* (https://github.com/frankvogt/vcf2gwas) and the SNPeff results (https://pcingola.github.io/SnpEff/). In the script "GWAS_results_temperature_WWC_Ztritici" you can find the function I used on the command line to run the *vcf2gwas* pipeline and all the data visualization and calculation of significance thresholds. The script "Significantvariantsthermaladaptation_QTLs_comparisons_and_SNPeff_display_WWC_Ztritici" contains the significant variance comparison in location with previously identified QTLs (Lendenmann et al. 2016) and some data visualization of the SNPeff results. The folder "SNPeff_and_intersect" contain some bash scripts that show how I built the database for the most recent *Z. tritici* annotation (Lapalu et al., 2023) and how I used SNPeff. 

## Phenotypic_data_analysis

In this folder you can find the R Markdown script "Ztritici_Temperature_Adaptation_phenotypicdataandbioclimvars" and its accompaning .html file. This script was made to analyze the data from microtiter plates with spore suspensions of the different strains at different temperature conditions and read through a plate reader (Optical Density). This is a very long script that describes the filtering steps, how I obtained OD to spore concentration curves, and the estimation of 12 growth-associated variables from the growth curves of each of the strains. I made an effort to describe each of the variables used and how they were obtained, however, if unclear refer to the diagram in Supplementary Figure S4 (to be confirmed). The methods used to obtain this variables include a custom made (by Alice Feurtey) loop to obtain the average between the Left and Right Riemann sums under a given growth curve, the use of a logistic function to analyze a given growth curve, the use of polynomial models to obtain particular information about a given growth curve, the use of a quadratic model to obtain the optimal growth temperature through the eAUC of growth curves at different temperatures for a given strain...


## Population_structure_and_popgen

Here there are many bash scripts and R Markdown and their accompaning .html files that all explain how I analyzed the SNP data for population structure analysis or population genetics analysis.
These analyses include the estimation of admixture coefficients (*snmf* function from the LEA package), the Analysis of Molecular Variance, the population differenciation (Fst), the nucleotide diversity, the Tajima's D and the principal component analysis (through plink).  

## SNP_calling

These are the bash scripts that describe the software, filters and options that I used to run SNP calling through GATK. These scripts include the software versions included in this analysis. 


--- 
### Disclaimer

My .Rmd files were in R Projects, which explains why there might not be a lot of paths to files in my scripts. Some issues might arise depending of system or software versions used, therefore, I cannot promise these scripts can be used directly as they are without a few tweaks. I annotated the scripts and I hope they are clear enough, however, there might be a few missmatches between the comments and the code here and there.  
