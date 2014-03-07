#!/bin/bash
file="191_sample.csv"
read fline < $file
IFS=", " arr=($fline)

col=1
for i in ${arr[@]};
do 
	if [ $i = $2 ]
	then
		break;
	fi
	((col = $col + 1))
done

sline=`sed -n '2p' < $file`
max=($sline)
maxi=${max[(($col - 1))]}
read -p "What did the student get on the assignment (out of $maxi)? " res

row=1
while read line
do
	IFS=", " tmp=($line)
	if [ ${tmp[0]} = $1 ]
	then
		case $res in
			*[!0-9]*)
				echo "Only numbers please."
				;;
			*)
				pts=" $res"
				sed -i "${row}s/[^,]*/$pts/"$col $file       
				;;
		esac
	fi
	((row = $row + 1))
done < $file
