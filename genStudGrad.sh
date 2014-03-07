#!/bin/bash
file="database.csv"

function get_total {
IFS=", " read -a arr < $file

col=0
for i in ${arr[@]};
do 
	if [ $i = $2 ]
	then
		break;
	fi
	((col = $col + 1))
done

sline=`sed -n '2p' < $file`
IFS=", " read -a array <<< "$sline"
total=${array[$col]}

while IFS=", " read line
do
	score=0
	IFS=", " read -a arr <<< "$line"
	key=${arr[0]}
	fname=${arr[2]}
	lname=${arr[1]}
	
	if [ $1 = $key ]
	then
		score=${arr[$col]}
		newFile=${1}_${2}_${score}
		touch "$newFile"
		echo "${fname} ${lname} (${key})" >> $newFile
		echo "$2" >> $newFile
		echo "Grade: ${score}/${total}" >> $newFile
	fi
done < $file

