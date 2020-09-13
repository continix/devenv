SHELL := /bin/bash

RUN_ARGS := $(wordlist 2,$(words $(MAKECMDGOALS)), $(MAKECMDGOALS))
$(eval $(RUN_ARGS):;@:)

.PHONY: all clean init plan apply

clean:
	rm -rf .build/*.tgz

shell:
	@docker-compose run --rm shell