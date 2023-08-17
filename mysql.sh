#!/bin/bash

USERID=$(id -u)
if [ $USERID -ne 0 ]
then
 echo "error: run on root acccess"
 exit 1
fi

yum install mysql -y 

if [ $? -ne 0 ]
then
 echo "mysql not success"
 exit 1
else
 echo "mysql success"
fi

yum install postfix -y

if [ $? -ne 0 ]
then
 echo "postfix not success"
 exit 1
else
 echo "mpostfix success"
fi

  