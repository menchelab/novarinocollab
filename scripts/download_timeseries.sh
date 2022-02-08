# download early development time course
# download metadata at https://singlecell.broadinstitute.org/single_cell/study/SCP1290/molecular-logic-of-cellular-diversification-in-the-mammalian-cerebral-cortex#study-download
# could also download fully processed dataset from there but only contains normalized and log1p transformed counts so we load from GEO
wget https://ftp.ncbi.nlm.nih.gov/geo/samples/GSM4635nnn/GSM4635075/suppl/GSM4635075_E14_5_filtered_gene_bc_matrices_h5.h5 -O data/mouse_brain_E14_5.h5
wget https://ftp.ncbi.nlm.nih.gov/geo/samples/GSM5277nnn/GSM5277845/suppl/GSM5277845_P4_filtered_feature_bc_matrix.h5 -O data/mouse_brain_P4.h5

# download adult data
# there is also a SMARTseq version of this dataset but I choose 10x here for consistency with the other dataset
wget http://data.nemoarchive.org/biccn/grant/u19_zeng/zeng/transcriptome/scell/10x_v2/mouse/processed/YaoHippo2020/CTX_Hip_anno_10x.csv.tar -O data/mouse_brain_adult_metadata.csv.tar
wget http://data.nemoarchive.org/biccn/grant/u19_zeng/zeng/transcriptome/scell/10x_v2/mouse/processed/YaoHippo2020/CTX_Hip_counts_10x.h5 -O data/mouse_brain_adult_counts.h5
wget http://data.nemoarchive.org/biccn/grant/u19_zeng/zeng/transcriptome/scell/10x_v2/mouse/processed/YaoHippo2020/CTX_Hip_umap_10x.csv.tar -O data/mouse_brain_adult_umap.csv.tar
tar -xvf data/mouse_brain_adult_metadata.csv.tar
tar -xvf data/mouse_brain_adult_umap.csv.tar

for extract in anno umap;
do
	mv CTX_Hip_${extract}_10x/CTX_Hip_${extract}_10x.csv data/mouse_brain_adult_${extract}.csv
done

rm data/*tar
