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

