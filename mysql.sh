#!/bin/bash

USERID=$(id -u)
if [ $USERID -ne 0 ]
then
 echo "error: run on root acccess"
 exit 1
fi

yum install mysql -y 
  