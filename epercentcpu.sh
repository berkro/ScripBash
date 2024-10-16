#/bin/bash


for PID in $(ps -e -o pid=)
do
	INFO=$(ps -p $PID -o pid=,cputime=,etime=)


	if [ $? -eq 0 ]
	then

		CTIME=$(echo $INFO | cut -d " " -f2)
		ETIME=$(echo $INFO | cut -d " " -f3)

		CHORA=$(echo $CTIME | cut -d ":" -f1)
		CHORA=$((10#$CHORA))
		CMIN=$(echo $CTIME | cut -d ":" -f2)
		CMIN=$((10#$CMIN))
		CSEC=$(echo $CTIME | cut -d ":" -f3)
		CSEC=$((10#$CSEC))


		CSECTOTAL=$(($CHORA*3600+$CMIN*60+$CSEC))


#	EHORA=$(echo $ETIME | cut -d ":" -f1)
#       EHORA=$((10#$EHORA))
        	EMIN=$(echo $ETIME | cut -d ":" -f1)
	        EMIN=$((10#$EMIN))
	        ESEC=$(echo $ETIME | cut -d ":" -f2)
		ESEC=$((10#$ESEC))

        	ESECTOTAL=$(($EMIN*60+$ESEC))

#	00:03:56    01:11:04

		PERCENT=$(($CSECTOTAL*100))
		CPUPERCENT=$(($PERCENT/$ESECTOTAL))

		echo $PID $CTIME $CSECTOTAL '(CPU Total sec)' $ETIME $ESECTOTAL '(Elapsed Total sec)' $CPUPERCENT% '(Cpu % usage)'
	fi
done
