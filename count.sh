#!/bin/bash
#
#SBATCH --job-name=count
#SBATCH --cpus-per-task=8
#SBATCH --mem=32GB
#SBATCH --time=60
#SBATCH --output=count.out
#SBATCH --mail-type=ALL
#SBATCH --mail-user=daniel.malzl@imp.ac.at

reference=data/gencode.vM28.annotation.gtf
module load subread/2.0.1-gcc-7.3.0-2.30

#featureCounts \
#	-a $reference \
#	-p \
#	-t exon \
#	-g gene_name \
#	-T 8 \
#	--ignoreDup \
#	-o raw/scRNA_featureCounts.tsv \
#	results/star_salmon/16*.bam

featureCounts \
	-a $reference \
	-t exon \
	-g gene_id \
	-T 8 \
	--ignoreDup \
	-o raw/RNA_featureCounts.tsv \
	results/star_salmon/8*.bam
