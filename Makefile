ifndef TF_VAR_civo_token
  $(error "Please set the civo_token environment variable")
endif

plan-infra:
	@cd infra && terraform init && terraform plan

apply-infra: plan-infra
	@cd infra && terraform apply -auto-approve

terratest:
	@cd _test && go test -v kubernetes_test.go

build-image:
	@pack build webapp:v1.0.0 --path app/src --builder gcr.io/buildpacks/builder:v1
