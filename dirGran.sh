#/bin/bash

if [ $# -lt 2 ]
then
	echo "[$(date '+%d/%m/%y %H:%M:%S')] | Param Error | Usage: ./dirGran.sh SIZE FILE[...]" >> /var/log/dirGran/output.log
	exit 1
fi

echo "[$(date '+%d/%m/%y %H:%M:%S')] | Script Iniciat" >> /var/log/dirGran/output.log

SIZE=$1

shift

while [ $# -gt 0 ]
do
	DIR=$1

	if [ ! -d $DIR ]
	then
		echo "[$(date '+%d/%m/%y %H:%M:%S')] | Directori no existeix" >> /var/log/dirGran/output.log
		echo "[$(date '+%d/%m/%y %H:%M:%S')] | Directori no existeix"
	fi

	FILES=$DIR/*

	FILE_SIZE=$(find $FILES -type f -exec stat --format="%s" {} \;)


	if [ $FILE_SIZE -gt $SIZE ]
	then
		echo find $FILES -type f -exec stat --format="%s" {} \;
	fi

	if [ $FILE_SIZE -gt $SIZE ]
	then
		echo "[$(date '+%d/%m/%y %H:%M:%S')] | Arxiu $FILE és més gran per $(($FILE_SIZE - SIZE)) bytes"
		echo "[$(date '+%d/%m/%y %H:%M:%S')] | Arxiu $FILE és més gran per $(($FILE_SIZE - SIZE)) bytes" >> /var/log/dirGran/output.log
	fi

	shift
done
