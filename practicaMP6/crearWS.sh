#!/bin/bash
aws ec2 run-instances --count "1" --image-id "ami-05f283f34603d6aed" --instance-type "t2.micro" --security-group-ids $1 \
		      --tag-specifications '{"ResourceType":"instance","Tags":[{"Key":"Name","Value":"Windows Server 2022"}]}' > /dev/null
