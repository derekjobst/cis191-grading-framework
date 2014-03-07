#!/bin/bash
source genStudGrad.sh $1 $2
var=$(cat $1_$2_*)
rm $1_$2_*

SUBJECT="Grade on $2"
EMAIL="$1@seas.upenn.edu"
EMAILMESSAGE="/tmp/emailmessage.txt"
echo "Grade Report:"> $EMAILMESSAGE
echo "$var" >>$EMAILMESSAGE
/bin/mail -s "$SUBJECT" "$EMAIL" < $EMAILMESSAGE
