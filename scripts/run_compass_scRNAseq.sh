#!/bin/bash
#
#SBATCH --job-name=compass
#SBATCH --cpus-per-task=10
#SBATCH --mem=64GB
#SBATCH --array=1-8
#SBATCH --output=out/compass_wtpm_%a.out
#SBATCH --mail-type=ALL
#SBATCH --qos=medium
#SBATCH --time=1440
#SBATCH --mail-user=daniel.malzl@imp.ac.at

sample=$(echo "astrocytes_ko astrocytes_wt neurons_ko neurons_wt oligodendrytes_ko oligodendrytes_wt olfactory_cells_ko olfactory_cells_wt" | awk -v var=$SLURM_ARRAY_TASK_ID '{print $var}')

for quant in novarino_tpm featureCounts_tpm salmon_tpm;
do
	mkdir -p compass/${quant}/${sample}
	compass --data processed/${quant}/${sample}.expression.tsv \
		--output-dir compass/${quant}/${sample} \
		--num-processes 10 \
		--calc-metabolites \
		--species mus_musculus 

	gzip compass/${quant}/${sample}/*tsv
done

# this script was modified for neurons with microclusters of sizes 3 and 5 for WT and KO to generate the novarino_tpm_micropooled results
