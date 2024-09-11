#!/bin/bash
 
# The file myvcflist is a text file containing one column with the each line giving the path to a g.vcf file. The extension is .list
 
source $1 
myvcflist=$2
#IDX=${LSB_JOBINDEX}
IDX=${SLURM_ARRAY_TASK_ID}

sample=$(sed -n ${IDX}p < ${myvcflist})
 
# Load modules
# ------------

module load gdc java/1.8.0_31 gatk/4.1.2.0

gatk --java-options "-Xmx8G"\
	IndexFeatureFile\
	-F ${sample}
