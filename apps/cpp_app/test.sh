#!/bin/bash

#use this bash script to test the output of the program

#write output to a variable
OUTPUT=`./helloworld`

EXIT_STATUS=$?

if [ "$OUTPUT" == "Hello World" ]; then
    echo "correct"
else
    echo "in correct"
    exit 1
fi