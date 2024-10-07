#/bin/bash

INFO=$(ps -p 1918 -o pid=,cputime=,etime=)

CTIME=$(echo $INFO | cut -d " " -f2)
ETIME=$(echo $INFO | cut -d " " -f3)

CHORA=$(echo $CTIME | cut -d ":" -f1)
CMIN=$(echo $CTIME | cut -d ":" -f2)


EHORA=$(echo $ETIME | cut -d ":" -f1)
EMIN=$(echo $ETIME | cut -d ":" -f2)

CSECHORA=$(($HORA*3600))
CSECMIN=$(($MIN*60))

echo $CTIME $ETIME $CSECMIN $CSECHORA $EHORA $EMIN

