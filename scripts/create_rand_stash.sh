#!/bin/bash

Y=$1
RANDOM=$$;
RANDOM2=$$;
for i in `seq $2`
do
	if [ $i = $RANDOM2 % $Y]
	then
		echo $(($RANDOM2%Y)) >> random.txt;
	fi
	echo $(($RANDOM%Y)) >> random.txt;
	git stash
done
