#!/bin/bash

DATE=$(date +%F)
SCRIPT_NAME=$0
LOG_FILE=/tmp/$SCRIPT_NAME-$DATE.log

R="\e[31m"
G="\e[32"
N="\e[32"

VALIDATE () {
    if [ $1 -ne 0 ]
    then 
       echo "$2...$R FAILURE $N hey ins not done " 
       exit 1
    else 
       echo "$2...$G Succsss $N hey its done now enjoy"
    fi
}

USERID=(id -u)
if [ $USERID -ne 0 ]
then 
   echo "$R OOPS ERROR you must installed this under root user"
   exit 1 
#else
#echo "okay"
fi

#now you have to see the whether installed or not 

yum install git -y 
VALIDATE $? "install the git it will be" &>>$LOG_FILE

yum install myslq -y 
VALIDATE $? "installing the mysql it will be " &>>$LOG_FILE

yum install postfix -y 
VALIDATE $? "installing the postfix it will be " &>>$LOG_FILE
