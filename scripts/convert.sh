#!/bin/bash
#
#SBATCH --job-name=convert
#SBATCH --cpus-per-task=4
#SBATCH --mem=16GB
#SBATCH --output=convert.out
#SBATCH --qos=long
#SBATCH --mail-type=ALL
#SBATCH --mail-user=daniel.malzl@imp.ac.at

module load samtools/1.10-foss-2018b
for bam in `ls data/*bam`;
do
	samtools collate -O $bam | samtools fastq -n -c 6 -@ 4 | gzip > ${bam%.*}.fq.gz
done
