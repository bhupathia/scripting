#!/bin/bash

DATE=$(date +%F)
SCRIPT_NAME=$0
LOGFILE=/tmp/$SCRIPT_NAME-$DATE.log
VALIDATE(){
 if [ $1 -ne 0 ]
then
 echo "$2 IS FAILURE"
 exit 1
else
 echo " $2 IS SUCCESS"
fi

}
USERID=$(id -u)

if [ $USERID -ne 0 ]
then
 echo "error: run on root acccess"
 exit 1
fi

yum install mysql -y &>>$LOGFILE
VALIDATE $? "installing mysql"



yum install postfix -y &>>$LOGFILE

VALIDATE $? "installing postfix"
  