#!/bin/sh

#  working directory /storage/home/d/dah65/scratch/NGS_map-snakemake/fixed_mate_bamfiles/
#  Modified by DAH on 2018-11-04
#  Single command "bamtools filter -mapQuality '>=20' -in BH10_F1_1_paired.fastq.gz.sam.bam.sorted.bam.fixed_mate.filtered.bam.post_dup.bam.RG.bam  -out BH10_F1_1_paired.fastq.gz.sam.bam.sorted.bam.fixed_mate.filtered.bam.post_dup.bam.RG.passed.bam"

# setting variables
ALL_SAMPLES=$(cat /storage/home/d/dah65/scratch/NGS_map-snakemake/fixed_mate_bamfiles/Allsamples.txt)

RAWREADS=$(echo "/storage/home/d/dah65/scratch/NGS_map-snakemake/fixed_mate_bamfiles")
REFDIR=$(echo "/storage/home/d/dah65/scratch/NGS_map-snakemake/fixed_mate_bamfiles")
ALNDIR=$(echo "/storage/home/d/dah65/scratch/NGS_map-snakemake/fixed_mate_bamfiles")
READSDIR=$(echo "/storage/home/d/dah65/scratch/NGS_map-snakemake/fixed_mate_bamfiles")

cd /storage/home/d/dah65/scratch/NGS_map-snakemake/fixed_mate_bamfiles

module use -a /storage/work/cxb585/groupmodules
module load bamtools

for i in $ALL_SAMPLES
do
        bamtools filter -mapQuality '>=20' -in ${READSDIR}/${i} -out ${READSDIR}/${i}.passed.bam
done

exit;