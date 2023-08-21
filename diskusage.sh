#!/bin/bash
LOG_DIR=/tmp
DATE=$(date +%F:%H:%M:%S)
SCRIPT_NAME=$0
LOGFILE=/$LOG_DIR/$SCRIPT_NAME-$DATE.log
R="\e[31m"
G="\e[32m"
N="\e[om"
Y="\e[33m"

DISK_USAGE=(df -hT | grep -vE 'tmpfs| filesyatem')
DISK_USAGE_THREESHOLD=1

while IFS= read line
do
  echo "output : $line"
done <<< $DISK_USAGE