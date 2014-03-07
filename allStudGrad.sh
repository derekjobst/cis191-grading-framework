#!/bin/bash
file="$1"

function get_total {
	IFS=", " read -a array <<< "$@"
	t=0
	i=3
	while [ $i -lt ${#array[@]} ]
	do
		((t = $t + ${array[$i]}))
		((i = $i + 1))
	done
	echo $t
}

sline=`sed -n '2p' < $file`
total=`get_total $sline`

while IFS=", " read line
do
	indTotal=0
	IFS=", " read -a arr <<< "$line"
	key=${arr[0]}
	if [ "PENNKEY" != $key ]
	then
		indTotal=`get_total $line`
		echo "${key}: ${indTotal}/${total}"
	fi
done < $file

