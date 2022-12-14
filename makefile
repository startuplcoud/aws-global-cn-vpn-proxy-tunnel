SHELL := /usr/bin/env bash
export AWS_PROFILE=$(profile)
export TF_PLUGIN_CACHE_DIR=$(HOME)/.terraform.d/plugin-cache

format:
	cd terraform && terraform fmt -check
	cd terraform && terraform fmt -recursive
	cd terragrunt && terragrunt hclfmt

validate:
	cd terragrunt/$(directory) && terragrunt run-all validate
plan:
	cd terragrunt/$(directory) && terragrunt run-all plan
apply:
	cd terragrunt/$(directory) && terragrunt run-all apply
destroy:
	cd terragrunt/$(directory) && terragrunt run-all destroy

plan-module:
	cd terragrunt/$(directory) && terragrunt run-all plan --terragrunt-include-dir $(module)

apply-module:
	cd terragrunt/$(directory) && terragrunt run-all apply --terragrunt-include-dir $(module)

destroy-module:
	cd terragrunt/$(directory) && terragrunt run-all destroy --terragrunt-working-dir $(module)

clean-cache:
	find . -type d -name ".terragrunt-cache" -prune -exec rm -rf {} \;

packer-fmt:
	cd packer && packer fmt .
	cd packer && packer validate .

packer-init:
	cd packer && packer init .

packer-build:
	cd packer && packer build -force .