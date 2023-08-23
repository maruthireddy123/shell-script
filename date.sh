#!/bin/bash

DATE=$(date +%F)
LOG_DIR=/home/centos/shell-script-logs
SCRIPT_NAME=$0
LOG_FILE=$LOG_DIR/$0-$DATE.log
USERD_ID=$(id -u)
R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"

if [ $USERD_ID -ne 0 ];
then 
   echo -e "$R ERROR please excute this commands in root user"
   exit 1 
fi

VALIDATE () {
    if [ $1 -ne 0 ];
    then
       echo -e "INSTALLING $2....$R FAILURE"
       exit 1 
    else 
       echo -e "INSTALLING $2....$G SUCCESS"
    fi
}

for i in $@
do 
 yum installed $i &>>$LOG_FILE
 if [ $? -ne 0 ]
 then 
   echo "$i is not installed , lets install it"
   yum install $i -y &>>$LOG_FILE
   VALIDATE $? "$i"
   else 
     echo -e "$Y $i is alreay installed $N"
     fi 
     done
