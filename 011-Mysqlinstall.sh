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

dnf list installed mysql

if [ $? -ne 0 ]
    then # mysql is not installed
        echo "MySQL is Installing ..."
        dnf install mysqld -y
        if [ $? -ne 0 ]
            then
                echo "Installation of MySQL ... FAILED"
                exit 1
            else
                echo "Installtion of MySQL ... SUCCESS"
            fi
    else
        echo "MySQL is already ... INSTALLED"
fi

