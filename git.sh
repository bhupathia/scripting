#!/bin/bash

USERID=$(id -u)
if [ $USERID -ne 0 ]
then
 echo "error: run on root acccess"
fi
yum install gi -y 
  