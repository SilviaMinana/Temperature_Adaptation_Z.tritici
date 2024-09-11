#!/bin/bash


# Define needed variables
# -----------------------
source $1
VCFBasename=$2
CHR=${SLURM_ARRAY_TASK_ID}
VCFNAME=${vcfdir}${VCFBasename}.${CHR}


# Load modules
# ------------
 module load gdc java/1.8.0_31 gatk/4.1.2.0


# Quality thresholds per position
# -------------------------------
FSTHR=10.0
MQTHR=20.0
QDTHR=20.0
ReadPosRankSum_lower=-2.0
ReadPosRankSum_upper=2.0
MQRankSum_lower=-2.0
MQRankSum_upper=2.0
BaseQRankSum_lower=-2.0
BaseQRankSum_upper=2.0


gatk VariantFiltration \
 -R ${refgenome} \
 -V ${VCFNAME}.vcf.gz \
 -O ${VCFNAME}.filtered.vcf \
   --filter-expression "FS > $FSTHR " --filter-name "FS_filter" \
   --filter-expression "MQ < $MQTHR"  --filter-name "MQ_filter" \
   --filter-expression "QD < $QDTHR"  --filter-name "QD_filter" \
   --genotype-filter-expression "DP < 3"   --genotype-filter-name "Low_depth"   --set-filtered-genotype-to-no-call   \
   --filter-expression 'ReadPosRankSum < $ReadPosRankSum_lower' --filter-name 'ReadPosRankSumL' \
   --filter-expression 'ReadPosRankSum > $ReadPosRankSum_upper' --filter-name 'ReadPosRankSumH' \
   --filter-expression 'MQRankSum < $MQRankSum_lower' --filter-name 'MQRankSumL'\
   --filter-expression 'MQRankSum > $MQRankSum_upper' --filter-name 'MQRankSumH' \
   --filter-expression 'BaseQRankSum < $BaseQRankSum_lower' --filter-name 'BaseQRankSumL' \
   --filter-expression 'BaseQRankSum > $BaseQRankSum_upper' --filter-name 'BaseQRankSumH' 


#Cleaning the file per pos
gatk  SelectVariants  \
  -R ${refgenome} \
  -V ${VCFNAME}.filtered.vcf \
  --exclude-filtered \
  --exclude-non-variants --remove-unused-alternates \
  -O ${VCFNAME}.filtered.clean.vcf
  
gzip -f ${VCFNAME}.filtered.vcf
gzip -f ${VCFNAME}.filtered.clean.vcf
