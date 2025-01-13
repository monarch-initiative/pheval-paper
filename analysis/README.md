# Analysis Phase

The `benchmark.sh` script executes the three sets of benchmarking analyses on the 9 configurations detailed in the manuscript: _Towards a standard benchmark for phenotype-driven variant and gene prioritisation algorithms: PhEval - Phenotypic inference Evaluation framework_

For each set of analysis (phenotypes only, phenotypes + genomic, and phenotypes + structural variants), the script will output:
* ROC curve plot in SVG format
* Precision-Recall curve in SVG format
* Rank Stats bar plot in SVG format
* A DuckDB database containing all the binary and ranking statistics related to the analysis