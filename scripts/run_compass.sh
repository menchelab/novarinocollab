#!/bin/bash
#
#SBATCH --job-name=compass
#SBATCH --cpus-per-task=10
#SBATCH --mem=64GB
#SBATCH --array=1-10
#SBATCH --output=out/compass_%a.out
#SBATCH --mail-type=ALL
#SBATCH --qos=medium
#SBATCH --time=1440
#SBATCH --mail-user=daniel.malzl@imp.ac.at

sample=$(echo "astrocytes_ko astrocytes_wt neurons_ko neurons_wt oligodendrytes_ko oligodendrytes_wt ollfactory_cell_ko ollfactory_cell_wt" | awk -v var=$SLURM_ARRAY_TASK_ID '{print $var}')

mkdir compass/${sample}
compass --data processed/${sample}.expression.tsv \
	--output-dir compass/${sample} \
	--num-processes 10 \
	--species mus_musculus 
