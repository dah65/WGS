#!/bin/sh

#  working directory /storage/home/d/dah65/scratch/NGS_map-snakemake/trimmed_cat
#  Modified by DAH on 2018-10-18.
#

# setting variables
ALL_SAMPLES=$(cat /storage/home/d/dah65/scratch/NGS_map-snakemake/trimmed_cat/Allsamples.txt)

RAWREADS=$(echo "/storage/home/d/dah65/scratch/NGS_map-snakemake/trimmed_cat")
REFDIR=$(echo "/storage/home/d/dah65/scratch/NGS_map-snakemake/trimmed_cat")
ALNDIR=$(echo "/storage/home/d/dah65/scratch/NGS_map-snakemake/trimmed_cat")


# bwa mem ref.fa reads.fq > aln-se.sam

for i in $ALL_SAMPLES
do
    module load bwa; bwa mem -t 8 ${REFDIR}/p_humanus_reference.fa ${READSDIR}/${i}.fastq.gz > ${ALNDIR}/${i}.sam

done

exit;