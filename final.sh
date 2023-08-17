#!/bin/bash

DATE=$(date +%F)
SCRIPT_NAME=$0
LOGFILE=/tmp/$SCRIPT_NAME-$DATE.log
R="\e[31m"
G="\e[32m"
N="\e[0m"

VALIDATE(){
    if [ $1 -ne 0 ]
    then
     echo - e "$2..  $R print error  $N"
     exit 1
    else
     echo -e "$2.. $G print success $N"
    fi 
}

USERID=$(id -u)
if [ $USERID -ne 0 ] 
then
 echo " erro :print on root access"
fi
yum install mysql -y &>>$LOGFILE 
VALIDATE $? "installing mysql"
yum install postfix -y &>>$LOGFILE
VALIDATE $> "installing postfix"