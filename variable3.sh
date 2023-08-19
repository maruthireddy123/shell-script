#1/bin/bash
NUMBER1=$!
NUMBER2=$2
SUM=$((NUMBER1+NUMBER2))
MIN=$((NUMBER1-NUMBER2))
MAX=$((NUMBER1*NUMBER2))
DIV=$((NUMBER1%NUMBER2))
echo "print the add value:$SUM"
echo "print the min value:$MIN"
echo "print the max value:$MAX"
echo "print the div value:$DIV"

