#!/bin/bash

DATE=$(date +%F)
LOGDIR=/home/centos/shell-script.logs
SCRIPT_NAME=$0
LOGFILE=/$LOGDIR/$SCRIPT_NAME-$DATE.log
R="\e[31m"
G="\e[32m"
N="\e[om"
Y="\e[33m"

USERID=$(id -u)
if [ $USERID -ne 0]
then
 echo :"print error run on root access"
 exit 1
fi 



VALIDATE(){
    if [ $1 -ne 0]
    then
     echo -e "Installing $2 ... $R failure $N "
     exit 1
    else
     echo -e "Installing $2 ... $G Success $N"
    fi  
}

for i in $@
do
 yum list installed $i &>>$LOGFILE
 if [ $? -ne 0]
 then
  echo  :"$i is not installed lets installed"
  yum install $i -y &>>$LOGFILE
  VALIDATE $? "$i"
 else
  echo -e : "$Y $i is  already installed "
fi
done

