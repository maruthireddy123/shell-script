#!/bin/bash

USERID=$(id -u)

VALIDATE() {
if [ $1 -ne 0 ]
then 
   echo "please intall the user under root user"
   exit 1
#else 
 # echo "you are root user we are install install the git"
  fi
}
   yum install mysql -y

VALIDATE $? 

yum install postfix -y 

VALIDATE $?

