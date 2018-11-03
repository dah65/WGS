#!/bin/sh

#  working directory /storage/home/d/dah65/scratch/NGS_map-snakemake/mapped_samfiles/
#  Modified by DAH on 2018-10-26.
#

# setting variables
ALL_SAMPLES=$(cat /storage/home/d/dah65/scratch/NGS_map-snakemake/mapped_samfiles/Allsamples.txt)

RAWREADS=$(echo "/storage/home/d/dah65/scratch/NGS_map-snakemake/mapped_samfiles")
REFDIR=$(echo "/storage/home/d/dah65/scratch/NGS_map-snakemake/mapped_samfiles")
ALNDIR=$(echo "/storage/home/d/dah65/scratch/NGS_map-snakemake/mapped_samfiles")

# samtools view -Sb -t ref.fai read.sam > read.bam

for i in $ALL_SAMPLES
do
    module load samtools; samtools view -Sb -t ${REFDIR}/p_humanus_reference.fai ${READSDIR}/${i} > ${ALNDIR}/${i}.bam

done

exit;