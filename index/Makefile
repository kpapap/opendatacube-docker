.PHONY: test test-bootstrapping test-indexing up down kpapap

test: test-bootstrapping test-indexing

test-bootstrapping:
	./test_bootstrapping.sh

test-indexing:
	./test_indexing.sh

make build: ## Rebuild the base image
	docker-compose build

up: ## Bring up the Docker environment
	docker-compose up

down: ## Bring down the system
	docker-compose down

shell: ## Start an interactive shell
	docker-compose exec openeo_odc_driver bash

kpapap:
	./kpapap.sh

clean: ## Delete everything
	docker-compose down --rmi all -v
