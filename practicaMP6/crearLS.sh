#!/bin/bash

aws ec2 run-instances --count "1" --image-id "ami-064519b8c76274859" --instance-type "t2.micro" --security-group-ids "$1" --key-name "vockey" \
		      --tag-specifications '{"ResourceType":"instance","Tags":[{"Key":"Name","Value":"Linux Server"}]}' > /dev/null
