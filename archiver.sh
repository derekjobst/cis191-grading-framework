#!/bin/bash
file="database.csv"

name=${2}_${1}_backup

tar -cf ${name}.tar ./database.csv

while IFS=", " read line
do
	IFS=", " read -a array <<< "$line"
	if [ ${array[0]} != "PENNKEY" ]
	then
		for i in $(find -name "${array[0]}*"); 
		do
			tmp=`sed "s/\n/ /g" <<< $i`
			tar -rf ${name}.tar $tmp
		done
	fi
done < $file

gzip ${name}.tar
