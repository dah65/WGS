#!/bin/sh

#  working directory /storage/home/d/dah65/scratch/NGS_map-snakemake/fixed_mate_bamfiles/
#  Modified by DAH on 2018-11-02
#  Single comman 

# java -jar ${PICARD}/picard.jar MarkDuplicates I= BH10_F1_1_paired.fastq.gz.sam.bam.sorted.bam.fixed_mate.filtered.bam O=BH10_F1_1_paired.fastq.gz.sam.bam.sorted.bam.fixed_mate.filtered.post_dup.bam VALIDATION_STRINGENCY=SILENT REMOVE_DUPLICATES=true MAX_FILE_HANDLES_FOR_READ_ENDS_MAP=4000 M= BH10_F1_1_paired.fastq.gz.sam.bam.sorted.bam.fixed_mate.filtered.post_dup_metrics.txt

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
        java -jar ${PICARD}/picard.jar MarkDuplicates I=${READSDIR}/${i} O=${READSDIR}/${i}.post_dup.bam VALIDATION_STRINGENCY=SILENT REMOVE_DUPLICATES=true MAX_FILE_HANDLES_FOR_READ_ENDS_MAP=4000 M= ${READSDIR}/${i}.metrics.txt

done

exit;

