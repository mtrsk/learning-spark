REGISTRY := pyspark-env
SHELL := bash

# Run `help` by default if nothing is provided
.DEFAULT_GOAL := help

all: build dev help
.PHONY: all

# Stolen from: https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
help:
	@echo "$$(tput bold)Commands:$$(tput sgr0)";echo;
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "%-30s%s\n", $$1, $$2}'

build: ## Builds a local image with the development tools
	@DOCKER_BUILDKIT=1 docker image build \
		--pull \
		--no-cache \
		--build-arg NB_USER=app \
		-t $(REGISTRY):dev .

dev: ## Runs the container in development mode
	@docker container run -it --rm \
		-v $(shell pwd):/home/app \
		-u $(shell id -u):$(shell id -g) \
		-p 8888:8888 \
		--entrypoint="" \
		$(REGISTRY):dev $(SHELL)
