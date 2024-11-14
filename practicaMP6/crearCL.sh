#!/bin/bash

NCLIENTS=$1

if [ $# -ne 1 ]; then
	echo "S'ha de especificar el nombre de clients a crear (10 max)"
	exit 1
fi

if [ "$NCLIENTS" -gt 10 ]; then
	echo "Com a maxim hi poden haver 10 clients"
	exit 1
fi

GRUPID= ./crearGrup.sh

aws ec2 run-instances --count "$NCLIENTS" --image-id "ami-064519b8c76274859" --instance-type "t2.micro" --security-groups $GRUPID \
		      --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=Linux Client}]" > /dev/null
