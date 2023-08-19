#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then 
   echo "please intall the user under root user"
   exit 1
#else 
 # echo "you are root user we are install install the git"
  fi

   yum install git -y

if [ $? -ne 0 ]
then 
   echo "Installation of mysql is errro"
else
   echo "Installation of mysql is success"
   fi