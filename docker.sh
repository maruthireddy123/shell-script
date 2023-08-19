#!/bin/bash

USERID=$(id -u)

VALIDATE () {
    if [ $1 -ne 0 ]
    then 
      echo " $2 failure"
      exit 1
    else 
       echo "$2 success"
    fi
}

yum install git -y

VALIDATE $? "installing the git "

yum install mysql -y

VALIDATE $? "Installing the mysql"

yum install postfix -y 

VALIDATE $? "installing the postfix"



