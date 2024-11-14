#!/bin/bash

GRUPID= ./crearGrup.sh

# Crear Windows Server
aws ec2 run-instances --count "1" --image-id "ami-05f283f34603d6aed" --instance-type "t2.micro" --security-groups $GRUPID \
		      --tag-specifications '{"ResourceType":"instance","Tags":[{"Key":"Name","Value":"Windows Server 2022"}]}' > /dev/null

# Crear Linux Server
aws ec2 run-instances --count "1" --image-id "ami-064519b8c76274859" --instance-type "t2.micro" --security-groups $GRUPID \
		      --tag-specifications '{"ResourceType":"instance","Tags":[{"Key":"Name","Value":"Linux Server"}]}' > /dev/null
