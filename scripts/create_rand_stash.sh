#!/bin/bash

Y=$1
RANDOM=$$;
for i in `seq $2`
do
	echo $(($RANDOM%Y)) >> random.txt;
	sleep 2
	git stash;
done
