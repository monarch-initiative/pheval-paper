# Towards a standard benchmark for phenotype-driven variant and gene prioritisation algorithms: PhEval - Phenotypic inference Evaluation framework

## Execution

To execute the analysis as described in Towards a standard benchmark for phenotype-driven variant and gene prioritisation algorithm: PhEval - Phenotypic inference Evaluation framework; run the following:

```shell
git clone https://github.com/yaseminbridges/pheval-paper.git

cd pheval-paper

bash run_pipeline.sh
```

This executes the following experiments:

# Tool Comparison Table

| **Analysis Type**               | **Corpus**               | **Tool**         | **Version**                  |
|----------------------------------|--------------------------|------------------|------------------------------|
| **Phenotype-only Analysis**     | 4K corpus                | Exomiser         | 14.0.2 & 2406 db release     |
|                                  |                          | GADO             | 1.0.4                        |
|                                  |                          | Phen2Gene        | 1.2.3                        |
|                                  |                          | PhenoGenius      | 1.1.1                        |
| **Phenotype + Genomic Analysis**| 4K corpus                | Exomiser         | 14.0.2 & 2406 db release     |
|                                  |                          | LIRICAL          | 2.0.2                        |
|                                  |                          | AI-MARRVEL       | 0.1.0                        |
| **Phenotype + Structural Variant Analysis** | Structural variant corpus | Exomiser  | 14.0.2 & 2406 db release     |
|                                  |                          | SvAnna           | 1.0.4                        |

## System and Storage Requirements

Before running the pipeline, please ensure your system meets the following requirements:

### Disk Space
- The pipeline downloads and processes configurations during the data preparation phase that require approximately **785 GB** of disk space.
- The size of the complete corpora, including VCF files and phenopackets for 3 sets of corpora, is approximately **423 GB**.
- Ensure you have sufficient free space on your system to avoid running out of storage during execution.

### CPU and Memory
- Some tools in the pipeline require a **minimum of 4 CPU cores** and **50 GB of RAM** to run successfully.

> **Note:** 
> Due to the computational demands of these experiments, they were run on a **High-Performance Computing (HPC)** system. Where possible, we strongly recommend using an HPC environment to ensure sufficient resources for complete execution. Running this pipeline on local machines with limited resources is not advised, as it may result in insufficient storage, memory, or prolonged runtimes.