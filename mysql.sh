#!/bin/bash

USERID=$(id -u)

VALIDATE() {
if [ $1 -ne 0 ]
then 
   echo "$2 .... failure"
   exit 1
   else 
   echo "$2 ... sucuuess"
#else 
 # echo "you are root user we are install install the git"
  fi
}
   yum install mysql -y

VALIDATE $? "MYSQL installing "

yum install postfix -y 

VALIDATE $? "Post installing"

