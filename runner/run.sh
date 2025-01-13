CURRENT_DIR=$(pwd)

# Run Exomiser

pip install pheval.exomiser

pheval run --input-dir "${CURRENT_DIR}"/configurations/exomiser-14.0.2/2406/variants --testdata-dir "${CURRENT_DIR}"/corpora/phenopacket_store_0.1.11_variants --output-dir "${CURRENT_DIR}"/results/exomiser-14.0.2-2406/phenopacket_store_0.1.11_variants --runner exomiserphevalrunner --version 14.0.2

pheval run --input-dir "${CURRENT_DIR}"/configurations/exomiser-14.0.2/2406/phenotype --testdata-dir "${CURRENT_DIR}"/corpora/phenopacket_store_0.1.11_phenotypes --output-dir "${CURRENT_DIR}"/results/exomiser-14.0.2-2406/phenopacket_store_0.1.11_phenotypes --runner exomiserphevalrunner --version 14.0.2

pheval run --input-dir "${CURRENT_DIR}"/configurations/exomiser-14.0.2/2406/variants --testdata-dir "${CURRENT_DIR}"/corpora/structural_variants --output-dir "${CURRENT_DIR}"/results/exomiser-14.0.2-2406/structural_variants --runner exomiserphevalrunner --version 14.0.2

pip uninstall pheval.exomiser

cd "${CURRENT_DIR}" || exit

# Run LIRICAL

pip install pheval.lirical

pheval run --input-dir "${CURRENT_DIR}"/configurations/lirical-2.0.2/2309 --testdata-dir "${CURRENT_DIR}"/corpora/phenopacket_store_0.1.11_variants --output-dir "${CURRENT_DIR}"/results/lirical-2.0.2-2309/phenopacket_store_0.1.11_variants --runner liricalphevalrunner --version 2.0.2

pip uninstall pheval.lirical

cd "${CURRENT_DIR}" || exit

# Run GADO

pip install pheval.gado

pheval run --input-dir "${CURRENT_DIR}"/configurations/gado-1.0.4 --testdata-dir "${CURRENT_DIR}"/corpora/phenopacket_store_0.1.11_phenotypes --output-dir "${CURRENT_DIR}"/results/gado-1.0.4/phenopacket_store_0.1.11_phenotypes --runner gadophevalrunner --version 1.0.4

pip uninstall pheval.gado

cd "${CURRENT_DIR}" || exit

# Run PhenoGenius

pip install poetry

cd configurations/phenogenius-1.1.1/2024-07-15/pheval.phenogenius || exit

poetry install

poetry shell

cd ../PhenoGenius || exit

poetry install

cd "${CURRENT_DIR}" || exit

pheval run --input-dir "${CURRENT_DIR}"/configurations/phenogenius-1.1.1/2024-07-15 --testdata-dir "${CURRENT_DIR}"/corpora/phenopacket_store_0.1.11_phenotypes --output-dir "${CURRENT_DIR}"/results/phenogenius-1.1.1-2024-07-15/phenopacket_store_0.1.11_phenotypes --runner phenogeniusphevalrunner --version 1.1.1

cd "${CURRENT_DIR}" || exit

deactivate

# Run SvAnna

pip install pheval.svanna

pheval run --input-dir "${CURRENT_DIR}"/configurations/svanna-1.0.4 --testdata-dir "${CURRENT_DIR}"/corpora/structural_variants --output-dir "${CURRENT_DIR}"/results/svanna-1.0.4/structural_variants --runner svannaphevalrunner --version 1.0.4

pip uninstall pheval.svanna

cd "${CURRENT_DIR}" || exit

# Run Phen2Gene

pip install pheval.phen2gene

pheval run --input-dir "${CURRENT_DIR}"/configurations/phen2gene-1.2.3 --testdata-dir "${CURRENT_DIR}"/corpora/phenopacket_store_0.1.11_phenotypes --output-dir "${CURRENT_DIR}"/results/phen2gene-1.2.3/phenopacket_store_0.1.11_phenotypes --runner phen2genephevalrunner --version 1.2.3

pip uninstall pheval.phen2gene

cd "${CURRENT_DIR}" || exit

# Run AI-MARRVEL

pip install pheval.ai_marrvel

pheval run --input-dir "${CURRENT_DIR}"/configurations/ai_marrvel-0.1.0 --testdata-dir "${CURRENT_DIR}"/corpora/phenopacket_store_0.1.11_variants --output-dir "${CURRENT_DIR}"/results/ai_marrvel-0.1.0/phenopacket_store_0.1.11_variants --runner aimarrvelphevalrunner --version 0.1.0

pip uninstall pheval.ai_marrvel

cd "${CURRENT_DIR}" || exit

