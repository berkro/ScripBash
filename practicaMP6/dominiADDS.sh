#!/bin/bash

IP=$1
DOMINI=$2

sed "s|hackaton.cat|$2|g" installADDS.ps1 > forestADDS.ps1
ssh -o StrictHostKeyChecking=no -i /home/belko/.ssh/aws Administrator@$IP powershell -Command - < forestADDS.ps1
