#!/bin/bash
DATE=$(date +%F)
LOGDIR=/tmp
SCRIPT_NAME=$0
LOGFILE=/$LOGDIR/$SCRIPT_NAME-$DATE.log
R="\e[31m"
G="\e[32m"
N="\e[om"
Y="\e[33m"

USERID=$(id -u)
if [ $USERID -ne 0 ]
then
 echo :"print error run on root access"
 exit 1
fi 


VALIDATE(){
    if [ $1 -ne 0 ]
    then
     echo -e "Installing $2 ... $R failure $N "
     exit 1
    else
     echo -e "Installing $2 ... $G Success $N"
    fi  
}
 cp mongo.repo /etc/yum.repos.d/mongo.repo &>>$LOGFILE

 VALIDATE $? "COPIED MONGO.REPO INTO yum.repos.d"
 yum install mongodb-org -y &>>$LOGFILE
 VALIDATE $? "installation of mongodb"
 systemctl enable mongod &>>$LOGFILE
 VALIDATE $? "mongodb enabled"
 systemctl start mongod &>>$LOGFILE
 VALIDATE $? "mongodb started"
 sed -i 's/127.0.0.1/0.0.0.0/' /etc/mongod.conf &>>$LOGFILE
 VALIDATE $? "edited mongodb.conf"
 systemctl restart mongod &>>$LOGFILE
 VALIDATE $? "restarted mongodb"