

PHENOGENIUS_VERSION := 1.1.1
PHENOGENIUS_NAME := phenogenius-$(PHENOGENIUS_VERSION)
PHENOGENIUS_DIR := $(CONFIG_DIR)/$(PHENOGENIUS_NAME)

# Install PhenoGenius
install-phenogenius:
	mkdir -p $(PHENOGENIUS_DIR)/2024-07-15
	git clone https://github.com/kyauy/PhenoGeniusCli.git $(PHENOGENIUS_DIR)/2024-07-15/PhenoGeniusCli
	git clone https://github.com/yaseminbridges/pheval.phenogenius.git $(PHENOGENIUS_DIR)/2024-07-15/pheval.phenogenius
	cp src/tools/configs/phenogenius-config.yaml $(PHENOGENIUS_DIR)/2024-07-15/config.yaml
	@echo "Installed $(PHENOGENIUS_NAME) in $(PHENOGENIUS_DIR)"

# TODO make poetry work here
# Run PhenoGenius
run-phenogenius: venv
	$(PIP) install poetry
	cd $(PHENOGENIUS_DIR)/2024-07-15/pheval.phenogenius && $(VENV_NAME)/bin/poetry install
	cd $(PHENOGENIUS_DIR)/2024-07-15/PhenoGeniusCli && $(VENV_NAME)/bin/poetry install
	mkdir $(RESULTS_DIR)/$(PHENOGENIUS_NAME)-2024-07-15/phenopacket_store_0.1.11_phenotypes
	$(VENV_NAME)/bin/pheval run --input-dir "$(PHENOGENIUS_DIR)/2024-07-15" \
		--testdata-dir "$(CORPORA_DIR)/phenopacket_store_0.1.11_phenotypes" \
		--output-dir "$(RESULTS_DIR)/$(PHENOGENIUS_NAME)-2024-07-15/phenopacket_store_0.1.11_phenotypes" \
		--runner phenogeniusphevalrunner --version $(PHENOGENIUS_VERSION)
