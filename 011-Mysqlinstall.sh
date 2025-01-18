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
        dnf install ramana -y
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

dnf list installed git

if [ $? -ne 0 ]
    then # git is not installed
        echo "Git is Installing ..."
        dnf install ramanarao -y
        if [ $? -ne 0 ]
            then
                echo "Installation of GIT ... FAILED"
                exit 1
            else   
                echo "Installation of GIT ... SUCCESS"
        fi
    else 
        echo "GIT is already ... INSTALLED"
fi