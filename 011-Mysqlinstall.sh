#!/bin/bash

USERID=$(id -u)
echo "${USERID}"

if [ $USERID -ne 0 ]
    then 
        echo "Error: To execute this script SUDO previlige is required"
        exit 1
    else
        echo "You are a ROOT User. Executing the Script..."
fi
