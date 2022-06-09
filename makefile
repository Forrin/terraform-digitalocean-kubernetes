.PHONY: test
test:
	@terraform fmt
	@terraform init
	@terraform validate
