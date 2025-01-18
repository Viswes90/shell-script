#!/bin/bash

NUMBER1=$1

# -gt, -lt, -eq, -le, -ge

if [ $NUMBER1 -lt 100 ]
    then
        echo "Given Number $NUMBER1 is greater than 100"
    else
        echo "Given Number $NUMBER1 is less than 100"
fi