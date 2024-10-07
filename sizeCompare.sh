#!/bin/bash
SIZE="$1"
FILE="$2"

if [ $# -ne 2 ]
 then
	echo "Usage: script.sh SIZE FILE" 
	exit 1
fi

FILE_SIZE=$(stat --format="%s" "$FILE")

if [ $FILE_SIZE -gt $SIZE ]
 then
	let DIFF=$FILE_SIZE-$SIZE
	echo "L'arxiu introduit és més gran que la mida introduida i la diferencia és $DIFF bytes"
fi
