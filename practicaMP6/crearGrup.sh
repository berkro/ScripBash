#!/bin/bash

NOMGRUP="HTgrup"

# Crear grup
aws ec2 create-security-group --group-name "$NOMGRUP" --description "$NOMGRUP" > /dev/null

# Afegir regles al grup
aws ec2 authorize-security-group-ingress --group-name $NOMGRUP --ip-permissions IpProtocol=tcp,FromPort=3389,ToPort=3389,IpRanges="[{CidrIp=0.0.0.0/0}]" \
										IpProtocol=tcp,FromPort=22,ToPort=22,IpRanges="[{CidrIp=0.0.0.0/0}]" > /dev/null

# Obtenir grup ID
GRUPID=$(aws ec2 describe-security-groups --group-name $NOMGRUP --query "SecurityGroups[0].GroupId" --output text)
echo "$GRUPID"
