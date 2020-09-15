.PHONY: init plan apply

shell:
	@docker-compose run --rm continix ash

showaws:
	@docker-compose run --rm showaws

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

output: apply
	@docker-compose run --rm output

destroy: init
	@docker-compose run --rm destroy

cleanNetwork:
	@docker network prune -f

tfhelp:
	@docker-compose run --rm tfhelp

phelp:
	@docker-compose run --rm phelp

validate:
	@docker-compose run --rm validate

build: validate
	@docker-compose run --rm build

inspect: validate
	@docker-compose run --rm inspect

fix:
	@docker-compose run --rm fix

console:
	@docker-compose run --rm console

hcl2_upgrade:
	@docker-compose run --rm hcl2_upgrade