#!/bin/bash

NOMGRUP="HTgrup"

DATE=$(date)

aws ec2 create-security-group --group-name "$NOMGRUP" --description "$NOMGRUP"

aws ec2 authorize-security-group-ingress --group-name $NOMGRUP --protocol tcp --port 3389 --cidr 0.0.0.0/0
