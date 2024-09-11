#!/bin/bash

module load bedtools2/2.30.0


bedtools intersect -wa -wb \
    -a Significant_temperaturefdr0.1_loci.bed \
    -b Significant_northamericafdr0.1_loci.bed Significant_HOTCOLDSHOCKfdr0.1_loci.bed Significant_GEAoverallfdr0.1_loci.bed Significant_GEAnorthamericafdr0.1_loci.bed Significant_GEAeuropefdr0.1_loci.bed Significant_europefdr0.1_loci.bed \
    -sorted \
    -filenames