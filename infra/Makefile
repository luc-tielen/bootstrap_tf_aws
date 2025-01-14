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

.PHONY: switch-staging plan-staging deploy-staging destroy-staging
.PHONY: switch-prod-hubi plan-prod-hubi deploy-prod-hubi destroy-prod-hubi
.PHONY: validate output format lint check
