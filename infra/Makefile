init:
	./scripts/init.sh

plan:
	./scripts/plan.sh

deploy:
	./scripts/deploy.sh

destroy:
	./scripts/destroy.sh

validate:
	tofu validate

output:
	tofu output

format:
	tofu fmt

lint:
	tofu fmt -check

check: validate lint

.PHONY: init plan deploy destroy validate output format lint check
