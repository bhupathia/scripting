#!/bin/bash

USERID=$(id -u)
VALIDATE(){
 if [ $1 -ne 0 ]
then
 echo "$2 IS FAILURE"
 exit 1
else
 echo " $2 IS SUCCESS"
fi

}
if [ $USERID -ne 0 ]
then
 echo "error: run on root acccess"
 exit 1
fi

yum install mysql -y 
VALIDATE $? "installing mysql"



yum install postfix -y

VALIDATE $? "installing postfix"
  