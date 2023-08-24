#!/bin/bash
LOG_FILE_DIR=/tmp
DATE=$(date +%F:%H:%M:%S)
SCRIPT_NAME=$0
LOG_FILE=$LOG_FILE_DIR/$SCRIPT_NAME-$DATE.log
R="\e[31"
G="\e[32"
N="\e[0m"
Y="\e[33m"

DISK_USAGE=$(df -hT | grep -vE 'tmpfs|Filesystem') &>>$LOG_FILE
DISK_USAGE_THRESHOLD=1
message=""

#IFS means internal field seperator is space:
 while IFS= read line 
 do 
  usage=$(echo $line | awk '{print $6}' | cut -d % -f1) &>>$LOG_FILE
  partition=$(echo $line | awk '{print $1}')
  if [ $usage -gt $DISK_USAGE_THRESHOLD ];
  then 
    message+="Hey maruthi HIGH DISK USAGE on $partition: $usage /n" &>>$LOG_FILE
    fi
done <<< $DISK_USAGE 

echo -e "message: $message" 

#echo "$message" | mail -s "High Disk usage" info@joindevops.com

#how to call other shell script from your current script
sh mail.sh sunrisershyd.srh123@gmail.com "High Disk Usage" "$message" "DEVOPS TEAM" "High Disk usage"