#!/bin/bash

USERID=$(id -u)
echo "${USERID}"

R="\e[31m"
G="\e[32m"
Y="\e[33m

VALIDATE()
{
    if [ $1 -ne 0 ]
        then
            echo -e "$2 ... $R FAILURE $N"
            exit 1
        else
            echo -e "$2 ... $G SUCCESS $N"
    fi
}

if [ $USERID -ne 0 ]
    then 
        echo -e "$R Error: To execute this script SUDO previlige is required $N"
        exit 1
    else
        echo -e "$G You are a ROOT User. Executing the Script...$N"
fi

dnf list installed mysql

if [ $? -ne 0 ]
    then # mysql is not installed
        echo "MySQL is Installing ..."
        dnf install mysql -y
        VALIDATE $? "Installing MySQL"
    else
        echo -e "MySQL is already ... $Y INSTALLED $N"
fi

dnf list installed git

if [ $? -ne 0 ]
    then # git is not installed
        echo "Git is Installing ..."
        dnf install git -y
        VALIDATE $? "Installing GIT"
    else 
        echo -e "GIT is already ... $Y INSTALLED $N"
fi