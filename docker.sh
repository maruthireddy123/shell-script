#!/bin/bash

USERID=$(id -u)

VALIDATE () {
    if [ $1 -ne 0 ]
    then 
      echo " failure"
      exit 1
    else 
       echo "success"
    fi
}

yum install git -y

VALIDATE $? "installing the git "

yum install mysql -y

VALIDATE $? "Installing the mysql"

yum install postfix -y 

VALIDATE $? "installing the postfix"



