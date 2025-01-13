CWD=$(pwd)

# Install corpora

pip install pheval

wget https://zenodo.org/records/14639917/files/pheval-paper.tar.gz?download=1

tar -zxf pheval-paper

mv pheval-paper/corpora .

wget https://ftp-trace.ncbi.nlm.nih.gov/ReferenceSamples/giab/release/NA12878_HG001/latest/GRCh37/HG001_GRCh37_1_22_v4.2.1_benchmark.vcf.gz

wget https://ftp-trace.ncbi.nlm.nih.gov/ReferenceSamples/giab/release/NA12878_HG001/latest/GRCh38/HG001_GRCh38_1_22_v4.2.1_benchmark.vcf.gz

wget https://ftp-trace.ncbi.nlm.nih.gov/ReferenceSamples/giab/data/AshkenazimTrio/analysis/PacBio_pbsv_05212019/HG002_GRCh38.pbsv.vcf.gz

pheval-utils prepare-corpus --phenopacket-dir "${CWD}"/corpora/phenopacket_store_0.1.11_variants/phenopackets --hg19-template-vcf HG001_GRCh37_1_22_v4.2.1_benchmark.vcf.gz --hg38-template-vcf HG001_GRCh38_1_22_v4.2.1_benchmark.vcf.gz --output-dir "${CWD}"/corpora/phenopacket_store_0.1.11_variants

pheval-utils prepare-corpus --phenopacket-dir "${CWD}"/corpora/structural_variants/phenopackets --hg38-template-vcf HG002_GRCh38.pbsv.vcf.gz --output-dir "${CWD}"/corpora/structural_variants

rm HG001_GRCh37_1_22_v4.2.1_benchmark.vcf.gz

rm HG001_GRCh38_1_22_v4.2.1_benchmark.vcf.gz

rm HG002_GRCh38.pbsv.vcf.gz

# Install and set up Exomiser configurations

mkdir -p configurations/exomiser-14.0.2/2406/variants

wget -P configurations/exomiser-14.0.2/2406/variants https://github.com/exomiser/Exomiser/releases/download/14.0.2/exomiser-cli-14.0.2-distribution.zip
wget -P configurations/exomiser-14.0.2/2406/variants https://g-879a9f.f5dc97.75bc.dn.glob.us/data/2406_phenotype.zip
wget -P configurations/exomiser-14.0.2/2406/variants https://g-879a9f.f5dc97.75bc.dn.glob.us/data/2406_hg19.zip
wget -P configurations/exomiser-14.0.2/2406/variants https://g-879a9f.f5dc97.75bc.dn.glob.us/data/2406_hg38.zip

unzip configurations/exomiser-14.0.2/2406/variants/2406_phenotype.zip -d configurations/exomiser-14.0.2/2406/variants
rm configurations/exomiser-14.0.2/2406/variants/2406_phenotype.zip

unzip configurations/exomiser-14.0.2/2406/variants/2406_hg19.zip -d configurations/exomiser-14.0.2/2406/variants
rm configurations/exomiser-14.0.2/2406/variants/2406_hg19.zip

unzip configurations/exomiser-14.0.2/2406/variants/2406_hg38.zip -d configurations/exomiser-14.0.2/2406/variants
rm configurations/exomiser-14.0.2/2406/variants/2406_hg38.zip

unzip configurations/exomiser-14.0.2/2406/variants/exomiser-cli-14.0.2-distribution.zip -d configurations/exomiser-14.0.2/2406/variants
rm configurations/exomiser-14.0.2/2406/variants/exomiser-cli-14.0.2-distribution.zip

cp configurations/exomiser-14.0.2-2406/exomiser-cli-14.0.2/examples/preset-exome-analysis.yaml configurations/exomiser-14.0.2/2406/variants
sed -i 'g/[ REVEL, MVP ]/[ REVEL, MVP, ALPHA_MISSENSE ]' configurations/exomiser-14.0.2/2406/variants/preset-exome-analysis.yaml

cp data_preparation/configs/exomiser-variant-config.yaml configurations/exomiser-14.0.2/2406/variants/config.yaml

mkdir -p configurations/exomiser-14.0.2/2406/phenotype

cp -r configurations/exomiser-14.0.2/2406/variants/exomiser-cli-14.0.2 configurations/exomiser-14.0.2/2406/phenotype
ln -s configurations/exomiser-14.0.2/2406/variants/2406_phenotype configurations/exomiser-14.0.2/2406/phenotype
ln -s configurations/exomiser-14.0.2/2406/variants/2406_hg19 configurations/exomiser-14.0.2/2406/phenotype
ln -s configurations/exomiser-14.0.2/2406/variants/2406_hg38 configurations/exomiser-14.0.2/2406/phenotype
cp configurations/exomiser-14.0.2/2406/variants/preset-exome-analysis.yaml configurations/exomiser-14.0.2/2406/phenotype

cp data_preparation/configs/exomiser-phenotype-config.yaml configurations/exomiser-14.0.2/2406/phenotype/config.yaml

# Install and set up LIRICAL configurations

mkdir -p configurations/lirical-2.0.2/2309/data

wget -P configurations/lirical-2.0.2/2309/data https://storage.googleapis.com/public-download-files/hgnc/tsv/tsv/hgnc_complete_set.txt

wget -P configurations/lirical-2.0.2/2309 https://github.com/TheJacksonLaboratory/LIRICAL/releases/download/v2.0.2/lirical-cli-2.0.2-distribution.zip

unzip configurations/lirical-2.0.2/2309/lirical-cli-2.0.2-distribution.zip -d configurations/lirical-2.0.2/2309

rm configurations/lirical-2.0.2/2309/lirical-cli-2.0.2-distribution.zip

java -jar configurations/lirical-2.0.2/2309/lirical-cli-2.0.2/lirical-cli-2.0.2.jar download -d configurations/lirical-2.0.2/2309/data

wget -P configurations/lirical-2.0.2/2309 https://g-879a9f.f5dc97.75bc.dn.glob.us/data/2309_hg19.zip

unzip configurations/lirical-2.0.2/2309/2309_hg19.zip -d configurations/lirical-2.0.2/2309

rm configurations/lirical-2.0.2/2309/2309_hg19.zip

wget -P configurations/lirical-2.0.2/2309 https://g-879a9f.f5dc97.75bc.dn.glob.us/data/2309_hg38.zip

unzip configurations/lirical-2.0.2/2309/2309_hg38.zip -d configurations/lirical-2.0.2/2309

rm configurations/lirical-2.0.2/2309/2309_hg38.zip

mv configurations/lirical-2.0.2/2309/2309_hg19/2309_hg19_variants.mv.db configurations/lirical-2.0.2/2309/

mv configurations/lirical-2.0.2/2309/2309_hg38/2309_hg38_variants.mv.db configurations/lirical-2.0.2/2309/

rm -r configurations/lirical-2.0.2/2309/2309_hg19

rm -r configurations/lirical-2.0.2/2309/2309_hg38

cp data_preparation/lirical-config.yaml configurations/lirical-2.0.2/2309/config.yaml

# Install and set up GADO configurations

mkdir -p configurations/gado-1.0.4

wget -P configurations/gado-1.0.4 https://github.com/molgenis/systemsgenetics/releases/download/GADO_1.0.4/GadoCommandline-1.0.4.tar.gz

tar -zxf configurations/gado-1.0.4/GadoCommandline-1.0.4.tar.gz -C configurations/gado-1.0.4

wget -P configurations/gado-1.0.4 https://molgenis26.gcc.rug.nl/downloads/genenetwork/v2.1/genenetwork_bonf_spiked.zip

unzip -d configurations/gado-1.0.4/genenetwork_bonf_spiked.zip configurations/gado-1.0.4

wget -P configurations/gado-1.0.4 https://molgenis26.gcc.rug.nl/downloads/genenetwork/v2.1/predictions_auc_bonf.txt

wget -P configurations/gado-1.0.4 https://molgenis26.gcc.rug.nl/downloads/genenetwork/v2.1/hpo_prediction_genes.txt

wget -P configurations/gado-1.0.4 https://github.com/obophenotype/human-phenotype-ontology/releases/download/v2024-12-12/hp.obo

cp data_preparation/configs/gado-config.yaml configurations/gado-1.0.4/config.yaml

# Install and set up PhenoGenius configurations

mkdir -p configurations/phenogenius-1.1.1/2024-07-15

git clone https://github.com/kyauy/PhenoGeniusCli.git configurations/phenogenius-1.1.1/2024-07-15/PhenoGeniusCli

git clone https://github.com/yaseminbridges/pheval.phenogenius.git configurations/phenogenius-1.1.1/2024-07-15/pheval.phenogenius

cp data_preparation/phenogenius-config.yaml configurations/phenogenius-1.1.1/2024-07-15/config.yaml

# Install and set up SvAnna configurations

mkdir -p configurations/svanna-1.0.4

wget -P configurations/svanna-1.0.4  https://github.com/monarch-initiative/SvAnna/releases/download/v1.0.4/svanna-cli-1.0.4-distribution.zip

unzip -d configurations/svanna-1.0.4 configurations/svanna-1.0.4/svanna-cli-1.0.4-distribution.zip

rm configurations/svanna-1.0.4/svanna-cli-1.0.4-distribution.zip

wget -P configurations/svanna-1.0.4 https://storage.googleapis.com/svanna/2304_hg38.svanna.zip

unzip -d configurations/svanna-1.0.4 -d configurations/svanna-1.0.4/2304_hg38.svanna.zip

rm  configurations/svanna-1.0.4/2304_hg38.svanna.zip

cp data_preparation/svanna-config.yaml configurations/svanna-1.0.4/config.yaml

# Install and set up Phen2Gene configurations

mkdir -p configurations/phen2gene-1.2.3

git clone https://github.com/WGLab/Phen2Gene.git configurations/phen2gene-1.2.3/Phen2Gene

cd configurations/phen2gene-1.2.3/Phen2Gene || exit
bash setup.sh <<< "../lib
../lib"

echo "${CWD}"
cd "${CWD}" || exit

cp data_preparation/configs/phen2gene-config.yaml configurations/phen2gene-1.2.3/config.yaml

# Install and set up AI-MARRVEL configuration

mkdir -p configurations/ai_marrvel-0.1.0

cd configurations/ai_marrvel-0.1.0 || exit

aws s3 sync s3://aim-data-dependencies-2.0-public . --no-sign-request

cd "${CWD}" || exit

cp data_preparation/configs/aim-config.yaml configurations/ai_marrvel-0.1.0/config.yaml
