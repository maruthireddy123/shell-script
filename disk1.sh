#!/bin/bash
LOG_FILE_DIR=/tmp
DATE=$(date +%F:%H:%M:%S)
SCRIPT_NAME=$0
LOG_FILE=$LOG_FILE_DIR/$SCRIPT_NAME-$DATE.log

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
    message+="HIGH DISK USAGE on $partition: $usage\n" &>>$LOG_FILE
    fi
done <<< $DISK_USAGE 

echo -e "message: $message" 
