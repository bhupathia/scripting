#!/bin/bash

APP_LOGS_DIR=/home/centos/app-logs
DATE=$(date +%F:%H:%M:%S)
LOGDIR=/home/centos/shell-script.logs
SCRIPT_NAME=$0
LOGFILE=/$LOGDIR/$SCRIPT_NAME-$DATE.log

FILE_TO_DELETE=$(Ffind $APP_LOGS_DIR -name "*.log" -type f -mtime +14)
echo "script started executed at $DATE"

while read line
do
 echo "deleting $line "&>>$LOGFILE
 rm -rf $line
done <<< $FILE_TO_DELETE