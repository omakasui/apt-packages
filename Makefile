SHELL   := /bin/bash
.DEFAULT_GOAL := help

PKG      ?=
VERSION  ?=
SUITES   ?= noble trixie
ALL_SUITES     := noble trixie
ALL_DEV_SUITES := noble-dev trixie-dev
SCRIPTS  := scripts

_require_pkg     = $(if $(PKG),,$(error PKG is required. Example: make $@ PKG=fzf))
_require_version = $(if $(VERSION),,$(error VERSION is required. Example: make $@ PKG=fzf VERSION=0.60.3))

.PHONY: help
help: ## Show this help
	@grep -E '^[a-zA-Z_-]+:.*##' $(MAKEFILE_LIST) | \
		awk 'BEGIN {FS = ":.*##"}; {printf "  \033[36m%-22s\033[0m %s\n", $$1, $$2}'

.PHONY: index
index: ## Regenerate Packages files from packages.tsv
	@bash $(SCRIPTS)/update-index.sh --suites "$(ALL_SUITES)"

.PHONY: sign
sign: ## Re-sign Release files for all suites (GPG_KEY_ID= required)
	$(if $(GPG_KEY_ID),,$(error GPG_KEY_ID is required. Example: make $@ GPG_KEY_ID=<fingerprint>))
	@bash $(SCRIPTS)/sign-release.sh \
		--suites "$(ALL_SUITES) $(ALL_DEV_SUITES)" \
		--key-id "$(GPG_KEY_ID)"

.PHONY: rebuild
rebuild: index sign ## Regenerate and sign all metadata (GPG_KEY_ID= required)

.PHONY: register
register: ## Register a package in stable (PKG= VERSION= SUITES= required)
	$(call _require_pkg)
	$(call _require_version)
	@bash $(SCRIPTS)/register-package.sh \
		--pkg     "$(PKG)" \
		--version "$(VERSION)" \
		--suites  "$(SUITES)"

.PHONY: register-dev
register-dev: ## Register a package in the dev channel (PKG= VERSION= SUITES= required)
	$(call _require_pkg)
	$(call _require_version)
	@bash $(SCRIPTS)/register-package.sh \
		--pkg     "$(PKG)" \
		--version "$(VERSION)" \
		--suites  "$(SUITES)" \
		--channel dev

.PHONY: promote
promote: ## Promote all dev entries to stable (SUITES= optional)
	@bash $(SCRIPTS)/promote-packages.sh --all --suites "$(SUITES)"

.PHONY: promote-pkg
promote-pkg: ## Promote a single package dev → stable (PKG= required, VERSION= optional)
	$(call _require_pkg)
	@bash $(SCRIPTS)/promote-packages.sh \
		--pkg    "$(PKG)" \
		--suites "$(SUITES)" \
		$(if $(VERSION),--version "$(VERSION)")

.PHONY: remove
remove: ## Remove a package from the index (PKG= required, SUITES= optional)
	$(call _require_pkg)
	@bash $(SCRIPTS)/remove-entries.sh \
		--package "$(PKG)" \
		$(if $(filter-out noble trixie,$(SUITES)),--suites "$(SUITES)")

.PHONY: prune-dry
prune-dry: ## Show stale releases in build-apt-packages (dry-run)
	@bash $(SCRIPTS)/prune-releases.sh

.PHONY: prune
prune: ## Delete stale releases in build-apt-packages
	@bash $(SCRIPTS)/prune-releases.sh --delete

.PHONY: list
list: ## List all packages and versions from packages.tsv
	@awk '{print $$3, $$4, $$1, $$2}' index/packages.tsv \
		| sort -u \
		| column -t || true

.PHONY: list-dev
list-dev: ## List packages not yet promoted to stable
	@awk '(NF>=11 && $$11=="dev") {print $$3, $$4, $$1, $$2}' index/packages.tsv \
		| sort -u \
		| column -t

.PHONY: info
info: ## Show index entries for a package (PKG= required)
	$(call _require_pkg)
	@awk '$$3 == "$(PKG)"' index/packages.tsv \
		| awk '{printf "suite=%-12s arch=%-6s ver=%-12s channel=%s\n", $$1, $$2, $$4, (NF>=11?$$11:"stable")}'

.PHONY: check
check: ## Count entries per suite/arch in the Packages files
	@for suite in $(ALL_SUITES) $(ALL_DEV_SUITES); do \
		for arch in amd64 arm64; do \
			f="dists/$${suite}/main/binary-$${arch}/Packages"; \
			[[ -f "$$f" ]] && printf "  %-18s %-6s %s entries\n" "$$suite" "$$arch" "$$(grep -c '^Package:' "$$f")"; \
		done; \
	done
