#!/bin/bash

# this is the comment, we need to develop a program that can do addition of 2 numbers

NUMBER1=$1
NUMBER2=$2
# I need to run a command inside shell to add these 2 numbers
SUM=$((NUMBER1+NUMBER2))
ADD=$((NUMBER1-NUMBER2))
MUL=$((NUMBER1*NUMBER2))
DIV=$((NUMBER1%NUMBER2))

echo "Addition of 2 numbers is: $SUM"
echo "Subtraction of 2 num is: $ADD"
echo "Multiaction of 2 num is: $MUL"
echo "division of 2 num is : $DIV"