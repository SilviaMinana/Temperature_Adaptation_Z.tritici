#!/bin/bash

module load bedtools2/2.30.0


bedtools intersect -wa -wb \
    -a Aroundgenesfile_SMP.bed \
    -b Significant_temperature_v3.bed Significant_HOTCOLDSHOCK_v3.bed Significant_GEAoverall_v3.bed Significant_GEAnorthamerica_v3.bed Significant_GEAeurope_v3.bed Significant_europe_v3.bed Significant_northamerica_v3.bed \
    -sorted \
    -filenames

