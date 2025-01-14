init:
	./scripts/init.sh

plan:
	./scripts/plan.sh

deploy:
	./scripts/deploy.sh

destroy:
	./scripts/destroy.sh

validate:
	terraform validate

output:
	terraform output

format:
	terraform fmt

lint:
	terraform fmt -check

check: validate lint

.PHONY: init plan deploy destroy validate output format lint check
