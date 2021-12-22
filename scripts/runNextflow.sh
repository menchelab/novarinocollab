module load java/1.8
nextflow run nf-core/rnaseq \
	-profile cbe \
	-w /scratch/daniel.malzl/work \
	--input meta/samples.csv \
	--genome mm10 \
	--skip_deseq2_qc \
	-resume
