.PHONY: pack test

VPC_ID ?= 123
SUBNET_ID ?= 123
AWS_SECRET_ACCESS_KEY ?= notreal
AWS_SESSION_TOKEN ?= notreal
AWS_ACCESS_KEY_ID ?= notreal


all: pack

pack:
	docker run -it -e AWS_SECRET_ACCESS_KEY -e AWS_SESSION_TOKEN -e AWS_ACCESS_KEY_ID \
	-e GIT_COMMIT -e GIT_BRANCH -e BUILD_NUMBER \
	-e VPC_ID -e SUBNET_ID -v ${PWD}/packer:/workdir hashicorp/packer:light build /workdir/win2016.json


test:
	./scripts/docker-invoke.sh example/ruby25 scripts/severspec-test.sh
