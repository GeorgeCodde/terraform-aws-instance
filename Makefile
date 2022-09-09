.PHONY: help
help: ## Print this help.
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

.PHONY: 
tf-init: ##  --terraform init--
	docker-compose -f deploy/docker-compose.yml run --rm terraform init

.PHONY: tf-show
tf-show: ##  --terraform show--
	docker-compose -f deploy/docker-compose.yml run --rm terraform show

.PHONY: tf-fmt
tf-fmt: ##  --terraform fmt--
	docker-compose -f deploy/docker-compose.yml run --rm terraform fmt

.PHONY: tf-validate
tf-validate: ##  --terraform validate--
	docker-compose -f deploy/docker-compose.yml run --rm terraform validate

.PHONY: tf-plan
tf-plan: ##  --terraform plan--
	docker-compose -f deploy/docker-compose.yml run --rm terraform plan

.PHONY: tf-apply
tf-apply: ##  --terraform apply--
	docker-compose -f deploy/docker-compose.yml run --rm terraform apply

.PHONY: tf-output
tf-output: ##  --terraform output--
	docker-compose -f deploy/docker-compose.yml run --rm terraform output
	
.PHONY: tf-destroy
tf-destroy: ##  --terraform destroy--
	docker-compose -f deploy/docker-compose.yml run --rm terraform destroy


.PHONY: tf-stl
tf-stl: ##  --terraform state list--
	docker-compose -f deploy/docker-compose.yml run --rm terraform state list

