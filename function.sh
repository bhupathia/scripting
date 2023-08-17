#!/bin/bash

USERID=$(id -u)
VALIDATE(){
 if [ $1 -ne 0 ]
then
 echo "INSTALLATION IS FAILURE"
 exit 1
else
 echo " INSTALLATION IS SUCCESS"
fi

}
if [ $USERID -ne 0 ]
then
 echo "error: run on root acccess"
 exit 1
fi

yum install mysql -y 
VALIDATE $?



yum install postfix -y

VALIDATE $?
  