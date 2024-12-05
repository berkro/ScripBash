#!/bin/bash

IP=$1
DOMINI=$2

if [ $# -ne 2 ]; then
	echo "El primer paràmetre ha de ser la IP pública de servidor, i el segon el nom del domini que volem crear."
	exit 1
fi

sed "s|hackaton.cat|$2|g" installADDS.ps1 > forestADDS.ps1
ssh -o StrictHostKeyChecking=no -i /home/belko/.ssh/aws Administrator@$IP powershell -Command - < forestADDS.ps1
