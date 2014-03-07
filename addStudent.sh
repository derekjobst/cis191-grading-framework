#!/bin/bash
file="database.csv"
read line < $file
number=`echo "$line" | tr -cd , | wc -c`
number=$(($number-2))
while IFS=", " read key lname fname rest
do
	if [ $1 = $key ] && [ $2 = $lname ] && [ $3 = $fname ]
	then
		echo "Student already exists"
		return 0
	fi
done < $file
echo -n "$1, $2, $3" >> $file
i=1
while [ $i -le $number ]
do
	if [ $i -ne $number ]
	then
		echo -n ", 0" >> $file
	else
		echo ", 0" >> $file
	fi
	((i = i + 1))
done


