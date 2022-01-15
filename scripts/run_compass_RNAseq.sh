#!/bin/bash
#
#SBATCH --job-name=compass
#SBATCH --cpus-per-task=10
#SBATCH --mem=64GB
#SBATCH --array=1-2
#SBATCH --output=out/compass_rna_%a.out
#SBATCH --mail-type=ALL
#SBATCH --mail-user=daniel.malzl@imp.ac.at

sample=$(echo "ko wt" | awk -v var=$SLURM_ARRAY_TASK_ID '{print $var}')

for quant in featureCounts_rna salmon_rna;
do
	mkdir -p compass/${quant}/${sample}
	compass --data processed/${quant}/${sample}.expression.tsv \
		--output-dir compass/${quant}/${sample} \
		--num-processes 10 \
		--calc-metabolites \
		--species mus_musculus 

	gzip compass/${quant}/${sample}/*tsv
done
