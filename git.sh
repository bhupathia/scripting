#!/bin/bash

USERID=$(id -u)
if [ $USERID -ne 0 ]
then
 echo "error: run on root acccess"
 exit 2
fi
yum install gi -y 
  