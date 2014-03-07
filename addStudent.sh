#!/bin/bash
file="191_sample.csv"
read line < $file
number=`echo "$line" | tr -cd , | wc -c`
number=$(($number-2))
while IFS=", " read key lname fname rest
do
	key1=`echo $key | sed 's/^ //'`
	lname1=`echo $lname | sed 's/^ //'`
	fname1=`echo $fname | sed 's/^ //'`
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

