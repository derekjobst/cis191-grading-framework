#!/bin/bash
file="database.csv"

new=", $1"

sed -i "1s/$/$new/" $file

read -p "What is the maximum number of points for this assignment? " res
case $res in
	*[!0-9]*)
	        echo "Only numbers please."
	        ;;
	*)
		pts=", $res"
		sed -i "2s/$/$pts/" $file        
	        ;;
esac

rows=0;
while read
do
	((rows = $rows + 1))
done < $file
i=3
while [[ $i -le $rows ]]
do
	sed -i "${i}s/$/, 0/" $file
	((i = $i + 1))
done < $file
