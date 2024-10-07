#/bin/bash

if [ $# -lt 2 ]
then
	echo "[$(date '+%d/%m/%y %H:%M:%S')] | Param Error | Usage: ./massaGran.sh SIZE FILE[...]" >> /var/log/massaGran/output.log
	exit 1
fi

echo "[$(date '+%d/%m/%y %H:%M:%S')] | Script Iniciat" >> /var/log/massaGran/output.log

SIZE=$1

shift

while [ $# -gt 0 ]
do
	FILE=$1
	FILE_SIZE=$(du -b $FILE | cut -f1)

	if [ ! -f $FILE ]
	then
		echo "[$(date '+%d/%m/%y %H:%M:%S')] | Arxiu no existeix" >> /var/log/massaGran/output.log
		echo "[$(date '+%d/%m/%y %H:%M:%S')] | Arxiu no existeix"
	fi

	if [ $FILE_SIZE -gt $SIZE ]
	then
		echo "[$(date '+%d/%m/%y %H:%M:%S')] | Arxiu $FILE és més gran per $(($FILE_SIZE - SIZE)) bytes"
		echo "[$(date '+%d/%m/%y %H:%M:%S')] | Arxiu $FILE és més gran per $(($FILE_SIZE - SIZE)) bytes" >> /var/log/massaGran/output.log
	fi

	shift
done
