#!/bin/bash


aws ec2 run-instances --image-id "ami-05f283f34603d6aed" --instance-type "t2.micro" --network-interfaces '{"AssociatePublicIpAddress":true,"DeviceIndex":0,"Groups":["$GRUPID"]}' '{"CpuCredits":"standard"}' \
										    --tag-specifications '{"ResourceType":"instance","Tags":[{"Key":"Name","Value":"Windows Server"}]}' --count "1"
