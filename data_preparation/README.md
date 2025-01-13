# Data Preparation Phase

The `install.sh` script handles all the installations and configuration directory structure required to run the following phenotype-driven gene and variant prioritisation tools in the PhEval pipeline as outlined in _Towards a standard benchmark for phenotype-driven variant and gene prioritisation algorithms: PhEval - Phenotypic inference Evaluation framework_:

* Exomiser
* AI-MARRVEL
* LIRICAL
* SvAnna
* Phen2Gene
* PhenGenius
* GADO

The structure of the configurations directory will look like something like so:

```tree
.
├── ai_marrvel-0.1.0
│   ├── annotate 
│   ├── bcf_annotate 
│   ├── config.yaml
│   ├── filter_vep 
│   ├── merge_expand 
│   ├── mod5_diffusion 
│   ├── model_inputs 
│   ├── omim_annotate 
│   ├── phrank 
│   ├── predict_new 
│   ├── var_tier 
│   └── vep 
├── exomiser-14.0.2
│   └── 2406
│       ├── phenotype
│       │   ├── 2406_hg19 
│       │   ├── 2406_hg38 
│       │   ├── 2406_phenotype 
│       │   ├── config.yaml
│       │   ├── exomiser-cli-14.0.2
│       │   └── preset-exome-analysis.yml
│       └── variants
│           ├── 2406_hg19 
│           ├── 2406_hg38 
│           ├── 2406_phenotype 
│           ├── config.yaml
│           ├── exomiser-cli-14.0.2
│           └── preset-exome-analysis.yml
├── gado-1.0.4
│   ├── config.yaml
│   ├── GadoCommandline-1.0.4
│   ├── genenetwork_bonf_spiked
│   ├── hp.obo
│   ├── hpo_prediction_genes.txt
│   └── predictions_auc_bonf.txt
├── lirical-2.0.2
│   └── 2309
│       ├── 2309_hg19_variants.mv.db 
│       ├── 2309_hg38_variants.mv.db 
│       ├── config.yaml
│       ├── data
│       │   ├── hg19_refseq.ser
│       │   ├── hg19_ucsc.ser
│       │   ├── hg38_refseq.ser
│       │   ├── hg38_ucsc.ser
│       │   ├── hgnc_complete_set.txt
│       │   ├── hp.json
│       │   ├── mim2gene_medgen
│       │   └── phenotype.hpoa
│       └── lirical-cli-2.0.2
├── phen2gene-1.2.3
│   ├── config.yaml
│   ├── lib
│   └── Phen2Gene
├── phenogenius-1.1.1
│   └── 2024-07-15
│       ├── config.yaml
│       ├── PhenoGeniusCli
│       └── pheval.phenogenius
└── svanna-1.0.4
    ├── checksum.sha256
    ├── config.yaml
    ├── gencode.v38.genes.json.gz
    ├── hp.json
    ├── svanna-cli-1.0.4
    └── svanna_db.mv.db

```