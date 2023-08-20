#!/bin/bash


DATE:$(date +%F)
SCRIPT_NAME=$0
LOG_FILE=/tmp/SCRIPT_NAME-$DATE.log

#introdeuce the colours

R="\e[31m"
G="\e[32m"
N="\e[0m"

#now validate the function with arugs
 
VALIDATE () {
    if [ $1 -ne 0 ]
    then
       echo -e "$2....$R Failure $N"
       exit 1
    else
       echo -e "$2...$G Success $N"
    fi    
    }

USERID=$(id -u)

   if [ $USERID -ne 0 ]
   then 
      echo "$R OOPS ERROR please run this under the root user"
#else
#echo "success"
fi

# now our responsiblity to check whether its installed or not 

yum install git -y &>>$LOG_FILE
VALIDATE $? "installing the mysql" 

yum install mysql -y &>>$LOG_FILE
VALIDATE $? "installing the postfix"

yum install git -y &>>$LOG_FILE
VALIDATE $? "installing the git " 
