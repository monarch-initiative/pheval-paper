
PHEN2GENE_VERSION := 1.2.3
PHEN2GENE_NAME := phen2gene-$(PHEN2GENE_VERSION)
PHEN2GENE_DIR := $(CONFIG_DIR)/$(PHEN2GENE_NAME)

# Install Phen2Gene
install-phen2gene:
	mkdir -p $(PHEN2GENE_DIR)
	git clone https://github.com/WGLab/Phen2Gene.git $(PHEN2GENE_DIR)/Phen2Gene
	cd $(PHEN2GENE_DIR)/Phen2Gene && \
		echo "../lib\n../lib" | bash setup.sh
	cp src/tools/configs/phen2gene-config.yaml $(PHEN2GENE_DIR)/config.yaml
	@echo "Installed $(PHEN2GENE_NAME) in $(PHEN2GENE_DIR)"


#TODO - FIX this ImportError: cannot import name 'GetCoreSchemaHandler' from 'pydantic' (/home/hhx640/Documents/GitHub/pheval-paper/.venv/lib/python3.12/site-packages/pydantic/__init__.cpython-312-x86_64-linux-gnu.so)
# Run Phen2Gene
run-phen2gene: venv
	$(PIP) install pheval.phen2gene
	mkdir -p $(RESULTS_DIR)/$(PHEN2GENE_NAME)/phenopacket_store_0.1.11_phenotypes
	$(VENV_NAME)/bin/pheval run --input-dir "$(PHEN2GENE_DIR)" \
		--testdata-dir "$(CORPORA_DIR)/phenopacket_store_0.1.11_phenotypes" \
		--output-dir "$(RESULTS_DIR)/$(PHEN2GENE_NAME)/phenopacket_store_0.1.11_phenotypes" \
		--runner phen2genephevalrunner --version $(PHEN2GENE_VERSION)
#	$(PIP) uninstall -y pheval.phen2gene
