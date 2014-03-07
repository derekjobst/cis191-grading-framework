#!/bin/bash
file="database.csv"
while IFS=", " read pennkey rest
do
	if [ $pennkey != "PENNKEY" ]
	then
		source emailGrade.sh $pennkey $1

	fi
done < $file
