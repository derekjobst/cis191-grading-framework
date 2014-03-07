A Grading Framework: CIS 191 project

authors: Derek Jobst and Satya Bodduluri

Instructions:
This suite of grading tools relies on the use of the command line (Terminal on Mac/Linux). A function is run with the following line, replacing "SCRIPT_NAME" with the name of the specific script and the appropriate arguments.

$ source SCRIPT_NAME.sh arg1 arg2 arg3

To add a student with the name Bob Saget and Pennkey bobs, type "source addStudent.sh bobs Saget Bob" into the command line.

Initializing a Database:
The database file used by this program is called "database.csv". It is important that this file is not modified directly by the user unless he/she knows exactly what they are doing.  There is also a sample database "database_sample.csv" with dummy data provided. To switch to the dummy data use the command "mv database_sample.csv database.csv".

Note: A empty database contains the following two lines and is a csv filetype:
PENNKEY, LAST_NAME, FIRST_NAME
PENNKEY, LAST_NAME, FIRST_NAME

A new database can be created with the "newDatabase" script.


Now, we present to you a list of all the possible scripts that can be run in the following format:

Script Name
Script Arguments (seperated by spaces)
Description

addStudent
pennkey last_name first_name
Add a student to the database.csv file. The script will generate a student, add him/her to the file, and give them 0's for all existing assignments, if there are any. If a student already exists, there will be a message in the terminal window and nothing will happen to the database.csv file.

Example: $ source addStudent.sh djobst jobst derek


removeStudent
pennkey
Removes a student from the database.csv file. The script will remove a student, if he/she exists in the database. Pretty straightforward.

Example: $ source removeStudent.sh djobst


addAssignment
assignment_name
Adds an assignment (hw, test, exam, project, etc.) to the database.csv file. Upon running the command, it will propt the user for a maximum value for the assignment. Enter a numerical value. The script adds an assignment to the end of the assignment list in the final (ie the assignment list is not chronological). It will automatically give every student in the database a 0 as a placeholder.

Example: 
$ source addAssignment.sh quiz1
What is the maximum number of points for this assignment? 100


addStudGrad
pennkey assignment_name
Gives a student a grade for a particular assignment. Upon calling the script, the script will prompt you to input a grade. Make sure to only give a numberical grade (ie 57 or 95 (duh)).

Example: $ source addStudGrad.sh djobst quiz1 100


getGrade
pennkey assignment_name
Returns the grade a student got for a particular assignment.

Example: $ source getGrade.sh djobst quiz1


allStudGrad
path/to/CSV
Displays list of total class grade as a fraction to the terminal window. The argument should be "database.csv" or another CSV file that you have created and conforms to the specifications of this suite.

Example: $ source allStudGrad.sh database.csv


emailGrade
pennkey assignment_name
This function retrieves teh grade a student got on a particular assignment and emails em at 'pennkey'@seas.upenn.edu the information.

Example: $ source emailGrade.sh djobst quiz1


emailAllGrade
assignment_name
All members of the class will be emailed with the assignment name, their score, and the max possible score on the defined assignment.

Example: $ source emailAllGrade.sh quiz1


archiver
Creates a tar.gz file containing all the files in the directory that have student grades in them.

Example: $ source archiver.sh

newDatabase
Creates a new database and archives the old database.

Example: $ source newDatabase.sh