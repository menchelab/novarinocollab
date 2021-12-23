#!/bin/bash
#
#SBATCH --job-name=count
#SBATCH --cpus-per-task=8
#SBATCH --mem=32GB
#SBATCH --time=60
#SBATCH --output=count.out
#SBATCH --mail-type=ALL
#SBATCH --mail-user=daniel.malzl@imp.ac.at

reference=/resources/references/igenomes/Mus_musculus/UCSC/mm10/Annotation/Genes/genes.gtf
module load subread/2.0.1-foss-2018b

featureCounts \
	-a $reference \
	-p \
	-t exon \
	-g gene_id \
	-T 8 \
	--ignoreDup \
	-o processed/scRNA_featureCounts.tsv \
	results/star_salmon/16*.bam

featureCounts \
	-a $reference \
	-t exon \
	-g gene_id \
	-T 8 \
	--ignoreDup \
	-o processed/RNA_featureCounts.tsv \
	results/star_salmon/8*.bam
