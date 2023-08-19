#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then 
   echo "please intall the user under root user"
else 
  echo "you are root user we are install install the git"

  yum install git -y

  fi
  