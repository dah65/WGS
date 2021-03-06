#!/bin/sh

#  working directory /storage/home/d/dah65/scratch/NGS_map-snakemake/mapped_samfiles/
#  Modified by DAH on 2018-10-26.
#

# setting variables
ALL_SAMPLES=$(cat /storage/home/d/dah65/scratch/NGS_map-snakemake/mapped_samfiles/Allsamples.txt)

RAWREADS=$(echo "/storage/home/d/dah65/scratch/NGS_map-snakemake/mapped_samfiles")
REFDIR=$(echo "/storage/home/d/dah65/scratch/NGS_map-snakemake/mapped_samfiles")
ALNDIR=$(echo "/storage/home/d/dah65/scratch/NGS_map-snakemake/mapped_samfiles")
READSDIR=$(echo "/storage/home/d/dah65/scratch/NGS_map-snakemake/mapped_samfiles")

# samtools view -Sb -t ref.fai read.sam > read.bam

cd /storage/home/d/dah65/scratch/NGS_map-snakemake/mapped_samfiles

module use -a /storage/work/cxb585/groupmodules

for i in $ALL_SAMPLES
do
      module load picard; java -jar {config[PICARD]} FixMateInformation INPUT={READSDIR} OUTPUT={ALNDIR}/${i}.sorted.fixed_mate.bam SORT_ORDER=coordinate VALIDATION_STRINGENCY=LENIENT CREATE_INDEX=true 

done

exit;