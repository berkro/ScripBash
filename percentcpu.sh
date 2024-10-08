#/bin/bash

INFO=$(ps -p 1857 -o pid=,cputime=,etime=)

CTIME=$(echo $INFO | cut -d " " -f2)
ETIME=$(echo $INFO | cut -d " " -f3)

CHORA=$(echo $CTIME | cut -d ":" -f1)
CMIN=$(echo $CTIME | cut -d ":" -f2)
CSEC=$(echo $CTIME | cut -d ":" -f3)

CSECHORA=$(($CHORA*3600))
CSECMIN=$(($CMIN*60))
CSECTOTAL=$(($CSECHORA+$CSECMIN+$CSEC))

EMIN=$(echo $ETIME | cut -d ":" -f1)
ESEC=$(echo $ETIME | cut -d ":" -f2)

ESECMIN=$(($EMIN*60))
ESECTOTAL=$(($ESECMIN+$ESEC))

PERCENT=$(($CSECTOTAL*100))
CPUPERCENT=$(($PERCENT/$ESECTOTAL))



echo $CTIME $CSECTOTAL $ETIME $ESECTOTAL $CPUPERCENT

