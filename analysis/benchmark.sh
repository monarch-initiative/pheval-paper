pip install pheval

pheval-utils generate-benchmark-stats --run-yaml analysis/configs/variant_runs.yaml

pheval-utils generate-benchmark-stats --run-yaml analysis/configs/structural_variant_runs.yaml

pheval-utils generate-benchmark-stats --run-yaml analysis/configs/phenotype_only_runs.yaml

pip uninstall pheval