.PHONY: init plan apply

shell:
	@docker-compose run --rm terraform bash

fmt:
	@docker-compose run --rm fmt

init: cleanNetwork
	@docker-compose run --rm init

get: init
	@docker-compose run --rm get

plan: get
	@docker-compose run --rm plan

apply: plan
	@docker-compose run --rm apply

destroy: init
	@docker-compose run --rm destroy

cleanNetwork:
	@docker network prune -f