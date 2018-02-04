.PHONY: pack

VPC_ID ?= 123
SUBNET_ID ?= 123


all: pack

pack:
	docker run -it -e $(VPC_ID) -e $(SUBNET_ID) -v ${PWD}/packer:/workdir hashicorp/packer:light build /workdir/win2016.json
