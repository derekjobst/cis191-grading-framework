#!/bin/bash
file="database.csv"
read -p "Are you sure? [y/N] " res
case $res in
	[Yy]|[Yy][Ee][Ss])
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
	*)
		echo "You didn't choose yes."        
		return 0
	        ;;
esac
