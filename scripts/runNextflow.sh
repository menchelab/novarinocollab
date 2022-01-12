module load java/1.8
nextflow run nf-core/rnaseq \
	-profile cbe \
	-w /scratch/daniel.malzl/work \
	--input meta/samples.csv \
	--fasta data/GRCm39.primary_assembly.genome.fa \
	--gtf data/gencode.vM28.annotation.gtf \
	--gencode \
	--skip_deseq2_qc \
	-resume
