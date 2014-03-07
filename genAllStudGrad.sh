#!/bin/bash
file="database.csv"

mkdir "$1"
cp $file ${1}/
while IFS=", " read line
do
	IFS=", " read -a array <<< "$line"
	if [ ${array[0]} != "PENNKEY" ]
	then
		cd $1/		
		source ../genStudGrad.sh ${array[0]} ${1}
		cd ..
	fi
done < $file

rm $1/$file
