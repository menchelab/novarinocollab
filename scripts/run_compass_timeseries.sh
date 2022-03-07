#!/bin/bash
#
#SBATCH --job-name=compass
#SBATCH --cpus-per-task=10
#SBATCH --mem=100GB
#SBATCH --array=1-11
#SBATCH --output=out/compass_timeseries_%a.out
#SBATCH --mail-type=ALL
#SBATCH --qos=medium
#SBATCH --mail-user=daniel.malzl@imp.ac.at

sample=$(echo "E14_5_Immature_Glutamatergic E14_5_Progenitors E14_5_Mature_Glutamatergic E14_5_GABAergic P4_Immature_Glutamatergic P4_Mature_Glutamatergic P4_GABAergic P4_Non_Neuronal Adult_Mature_Glutamatergic Adult_GABAergic Adult_Non_Neuronal" | awk -v var=$SLURM_ARRAY_TASK_ID '{print $var}')

cluster_size=$(echo "12 10 6 1 9 33 8 10 742 40 21" | awk -v var=$SLURM_ARRAY_TASK_ID '{print $var}')

quant=timeseries_tpm
echo "$sample $cluster_size"
mkdir -p compass/${quant}/${sample}
if [ $cluster_size > 1 ]
then
	compass --data processed/${quant}/${sample}.expression.tsv \
		--output-dir compass/${quant}/${sample} \
		--num-processes 10 \
		--microcluster-size $cluster_size \
		--calc-metabolites \
		--species mus_musculus
else
	compass --data processed/${quant}/${sample}.expression.tsv \
		--output-dir compass/${quant}/${sample} \
		--num-processes 10 \
		--calc-metabolites \
		--species mus_musculus
fi	

gzip compass/${quant}/${sample}/*tsv

