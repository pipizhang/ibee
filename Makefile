SHELL := /bin/bash

help: ## This help message
	@echo "Usage: make [target]"
	@echo "Commands:"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-20s\033[0m %s\n", $$1, $$2}'

.PHONY:test
test: ## Run tests
	exec go test -v ./korkort

.PHONY:docker-build
docker-build: ## Build docker image
	@echo "build docker image ..."
	@exec docker build --no-cache -t ibee .
	@echo "done"

.PHONY:docker-run
docker-run: ## Start a container
	@echo "start docker container ..."
	@exec docker run --rm -it --name "ibee-dev" --hostname "ibee-dev" -p 8080:8080 -v $$(pwd):/go/src/ibee ibee

.PHONY:docker-clean
docker-clean: ## Run docker prune
	@echo "y" | docker image prune

