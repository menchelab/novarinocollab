wget https://ftp.ebi.ac.uk/pub/databases/gencode/Gencode_mouse/release_M28/gencode.vM28.annotation.gtf.gz -O data/gencode.vM28.annotation.gtf.gz
gunzip data/gencode.vM28.annotation.gtf.gz
cat data/gencode.vM28.annotation.gtf | grep -v '^#' > gencode.vM28.annotation.gtf
mv gencode.vM28.annotation.gtf data
wget https://ftp.ebi.ac.uk/pub/databases/gencode/Gencode_mouse/release_M28/GRCm39.primary_assembly.genome.fa.gz -O data/GRCm39.primary_assembly.genome.fa.gz
gunzip data/GRCm39.primary_assembly.genome.fa.gz
