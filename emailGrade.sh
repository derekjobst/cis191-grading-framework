#!/bin/bash
source genStudGrad.sh $1 $2
var=$(cat $1_$2_*)
rm $1_$2_*

echo "Emailed: $var"
 
# email subject
SUBJECT="Grade on $2"
# Email To ?
EMAIL="djobst@seas.upenn.edu"
# Email text/message
EMAILMESSAGE="/tmp/emailmessage.txt"
echo "Grade Report:"> $EMAILMESSAGE
echo "$var" >>$EMAILMESSAGE
# send an email using /bin/mail
/bin/mail -s "$SUBJECT" "$EMAIL" < $EMAILMESSAGE
