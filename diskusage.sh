#!/bin/bash
LOG_DIR=/tmp
DATE=$(date +%F:%H:%M:%S)
SCRIPT_NAME=$0
LOGFILE=/$LOG_DIR/$SCRIPT_NAME-$DATE.log
R="\e[31m"
G="\e[32m"
N="\e[om"
Y="\e[33m"

DISK_USAGE=$(df -hT | grep -vE 'tmpfs|filesystem')
DISK_USAGE_THREESHOLD=1
message=""

while IFS= read line
do
# this command used for percemtage used for numbers
usage=$(echo $line | awk '{print$6}'|cut -d % -f1)
# this command gives partiotons
partition=$(echo $line | awk '{print $1}')
# now you need check more than thre shold or not
if [ $usage -gt $DISK_USAGE_THREESHOLD ]
then
 message+=" HIGH DISK USAGE ON :$usage: $partition \n"
fi 
done <<< $DISK_USAGE
 echo -e "message : $message"

 #echo "$message" | mail -s "high disk usage" bhupathinaidu.bpn@gmail.com
 sh mail.sh bhupathinaidu.bpn@gmail.com "High Disk Usage" "$message" "Devops Team" "High Disk Usagesh"