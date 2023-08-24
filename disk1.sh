#!/bin/bash
LOG_FILE_DIR=/tmp
DATE=$(date +%F)
SCRIPT_NAME=$0
LOG_FILE=$LOG_FILE_DIR/$SCRIPT_NAME-$DATE.log

DISK_USGAGE=$(df -hT | grep -vE 'tmpfs|Filesystem')
DISK_USGAGE_THRESHOLD=1
message=""

while IFS read line
do 
usage=$(echo $line | awk '{print $6}' | cut -d % f1)
partition=$(echo $line | awk '{print1}')
if [ $usage -gt $DISK_USGAGE_THRESHOLD ];
then
message+= "HIGH DISK USGAE for $partition: $usage\n"
fi 
done <<< $DISk_USAGE
echo -e "message: $message"