#!/bin/bash
file="database.csv"

f=`sed -n '1p' < $file`
IFS=", " read -a firsta <<< "$f"

s=`sed -n '2p' < $file`
IFS=", " read -a seconda <<< "$s"

i=3

while IFS=", " read key first last rest
do
	if [ $key = $1 ]
	then
		echo "$last $first ($key)"
		
		for j in $rest
		do
			tmp=`echo $j |grep -Eo '[0-9]*'`
			echo "${firsta[$i]} $tmp/${seconda[$i]}"
			i=($i+1)
		done		
	fi

done < $file
