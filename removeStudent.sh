#!/bin/bash
file="191_sample.csv"
read -p "Are you sure? [y/N] " res
case $res in
	[Yy])
	        while IFS=", " read key lname fname rest
		do
			if [ $1 = $key ] && [ $2 = $lname ] && [ $3 = $fname ]
			then
				sed -i "/$1, $2, $3, /d" $file
				return 0
			fi
		done < $file
		echo "Student doesn't exist."
		return 0
	        ;;
	[Nn])
		echo "You chose no."        
		return 0
	        ;;
	*) 
		echo "Please answer yes or no."
		;;
esac
