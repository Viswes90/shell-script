#!/bin/bash

USERID=$(id -u)
echo "${USERID}"

VALIDATE()
{
    if [ $1 -ne 0 ]
        then
            echo "$2 ... FAILURE"
            exit 1
        else
            echo "$2 ... SUCCESS"
    fi
}

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
        dnf install mysql -y
        VALIDATE $? "Installing MySQL"
    else
        echo "MySQL is already ... INSTALLED"
fi

dnf list installed git

if [ $? -ne 0 ]
    then # git is not installed
        echo "Git is Installing ..."
        dnf install git -y
        VALIDATE $? "Installing GIT"
    else 
        echo "GIT is already ... INSTALLED"
fi