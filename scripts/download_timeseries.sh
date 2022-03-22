# download early development time course
# download metadata at https://singlecell.broadinstitute.org/single_cell/study/SCP1290/molecular-logic-of-cellular-diversification-in-the-mammalian-cerebral-cortex#study-download
# could also download fully processed dataset from there but only contains normalized and log1p transformed counts so we load from GEO
wget https://ftp.ncbi.nlm.nih.gov/geo/samples/GSM5277nnn/GSM5277843/suppl/GSM5277843_E10_v1_filtered_feature_bc_matrix.h5 -O data/mouse_brain_E10_5.h5
wget https://ftp.ncbi.nlm.nih.gov/geo/samples/GSM4635nnn/GSM4635072/suppl/GSM4635072_E11_5_filtered_gene_bc_matrices_h5.h5 -O data/mouse_brain_E11_5.h5
wget https://ftp.ncbi.nlm.nih.gov/geo/samples/GSM4635nnn/GSM4635073/suppl/GSM4635073_E12_5_filtered_gene_bc_matrices_h5.h5 -O data/mouse_brain_E12_5.h5
wget https://ftp.ncbi.nlm.nih.gov/geo/samples/GSM4635nnn/GSM4635074/suppl/GSM4635074_E13_5_filtered_gene_bc_matrices_h5.h5 -O data/mouse_brain_E13_5.h5
wget https://ftp.ncbi.nlm.nih.gov/geo/samples/GSM4635nnn/GSM4635075/suppl/GSM4635075_E14_5_filtered_gene_bc_matrices_h5.h5 -O data/mouse_brain_E14_5.h5
wget https://ftp.ncbi.nlm.nih.gov/geo/samples/GSM4635nnn/GSM4635076/suppl/GSM4635076_E15_5_S1_filtered_gene_bc_matrices_h5.h5 -O data/mouse_brain_E15_5.h5
wget https://ftp.ncbi.nlm.nih.gov/geo/samples/GSM4635nnn/GSM4635077/suppl/GSM4635077_E16_filtered_gene_bc_matrices_h5.h5 -O data/mouse_brain_E16_5.h5
wget https://ftp.ncbi.nlm.nih.gov/geo/samples/GSM5277nnn/GSM5277844/suppl/GSM5277844_E17_5_filtered_feature_bc_matrix.h5 -O data/mouse_brain_E17_5.h5
wget https://ftp.ncbi.nlm.nih.gov/geo/samples/GSM4635nnn/GSM4635078/suppl/GSM4635078_E18_5_S1_filtered_gene_bc_matrices_h5.h5 -O data/mouse_brain_E18_5_rep1.h5
wget https://ftp.ncbi.nlm.nih.gov/geo/samples/GSM4635nnn/GSM4635079/suppl/GSM4635079_E18_S3_filtered_gene_bc_matrices_h5.h5 -O data/mouse_brain_E18_5_rep2.h5
wget https://ftp.ncbi.nlm.nih.gov/geo/samples/GSM4635nnn/GSM4635080/suppl/GSM4635080_P1_S1_filtered_gene_bc_matrices_h5.h5 -O data/mouse_brain_P1_rep1.h5
wget https://ftp.ncbi.nlm.nih.gov/geo/samples/GSM4635nnn/GSM4635081/suppl/GSM4635081_P1_S2_filtered_gene_bc_matrices_h5.h5 -O data/mouse_brain_P1_rep2.h5
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
