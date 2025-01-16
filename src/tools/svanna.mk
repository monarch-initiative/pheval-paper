
SVANNA_VERSION := 1.0.4
SVANNA_NAME := svanna-$(SVANNA_VERSION)
SVANNA_DIR := $(CONFIG_DIR)/$(SVANNA_NAME)


# TODO FIX error: invalid zip file with overlapped components (possible zip bomb)
# Install SvAnna
install-svanna:
	mkdir -p $(SVANNA_DIR)
	cd $(SVANNA_DIR) && \
		wget https://github.com/monarch-initiative/SvAnna/releases/download/v$(SVANNA_VERSION)/svanna-cli-$(SVANNA_VERSION)-distribution.zip && \
		unzip svanna-cli-$(SVANNA_VERSION)-distribution.zip && rm svanna-cli-$(SVANNA_VERSION)-distribution.zip && \
		wget https://storage.googleapis.com/svanna/2304_hg38.svanna.zip && \
		unzip 2304_hg38.svanna.zip && rm 2304_hg38.svanna.zip
	cp src/tools/configs/svanna-config.yaml $(SVANNA_DIR)/config.yaml
	@echo "Installed $(SVANNA_NAME) in $(SVANNA_DIR)"


# TODO FIX ImportError: cannot import name 'GetCoreSchemaHandler' from 'pydantic' (/home/hhx640/Documents/GitHub/pheval-paper/.venv/lib/python3.12/site-packages/pydantic/__init__.cpython-312-x86_64-linux-gnu.so)
# Run SvAnna
run-svanna: venv
	$(PIP) install pheval.svanna
	$(VENV_NAME)/bin/pheval run --input-dir "$(SVANNA_DIR)" \
		--testdata-dir "$(CORPORA_DIR)/structural_variants" \
		--output-dir "$(RESULTS_DIR)/$(SVANNA_NAME)/structural_variants" \
		--runner svannaphevalrunner --version $(SVANNA_VERSION)
