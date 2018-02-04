.PHONY: pack

VPC_ID := $(aws cloudformation  list-exports --region ap-southeast-2 --query 'Exports[?Name==`tnh-vpc-VpcId`]' --output text  | awk '{print $3}')
SUBNET_ID ?= $(aws cloudformation  list-exports --region ap-southeast-2 --query 'Exports[?Name==`tnh-vpc-InternalSubnets`]' --output text  | awk '{print $3}' | awk -F "," '{print $1}')

all: pack

pack:
        docker run -it -e VPC_ID -e SUBNET_ID -v ${PWD}:/workdir hashicorp/packer:light build /workdir/packer/win2016.json
