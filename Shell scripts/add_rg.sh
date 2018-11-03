#!/bin/sh

#  working directory /storage/home/d/dah65/scratch/NGS_map-snakemake/fixed_mate_bamfiles/
#  Modified by DAH on 2018-11-04
#  Single command "java -jar ${PICARD}/picard.jar AddOrReplaceReadGroups I=BH10_F1_1_paired.fastq.gz.sam.bam.sorted.bam.fixed_mate.filtered.bam.post_dup.bam O=BH10_F1_1_paired.fastq.gz.sam.bam.sorted.bam.fixed_mate.filtered.bam.post_dup.RG.bam RGLB=BH10_F1_1_paired.fastq.gz.sam.bam.sorted.bam.fixed_mate.filtered.bam.post_dup.bam RGPL=Illumina RGSM=BH10_F1_1_paired.fastq.gz.sam.bam.sorted.bam.fixed_mate.filtered.bam.post_dup.bam RGPU=Group1"

# setting variables
ALL_SAMPLES=$(cat /storage/home/d/dah65/scratch/NGS_map-snakemake/fixed_mate_bamfiles/Allsamples.txt)

RAWREADS=$(echo "/storage/home/d/dah65/scratch/NGS_map-snakemake/fixed_mate_bamfiles")
REFDIR=$(echo "/storage/home/d/dah65/scratch/NGS_map-snakemake/fixed_mate_bamfiles")
ALNDIR=$(echo "/storage/home/d/dah65/scratch/NGS_map-snakemake/fixed_mate_bamfiles")
READSDIR=$(echo "/storage/home/d/dah65/scratch/NGS_map-snakemake/fixed_mate_bamfiles")

cd /storage/home/d/dah65/scratch/NGS_map-snakemake/fixed_mate_bamfiles

module use -a /storage/work/cxb585/groupmodules
module load picard/2.10.10
for i in $ALL_SAMPLES
do
		java -jar ${PICARD}/picard.jar AddOrReplaceReadGroups I=${READSDIR}/${i} O=${READSDIR}/${i}.RG.bam RGLB=${READSDIR}/${i} RGPL=Illumina RGSM=${READSDIR}/${i} RGPU=Group1
done

exit;