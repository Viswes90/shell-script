#!/bin/bash


USERID=$(id -u)
echo "${USERID}"

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOGS_FOLDER="/var/log/viswa_logs"
LOG_FILE=$( echo $0 | cut -d "." -f1 )
TIMESTAMP=$( date +%Y-%m-%d-%H-%M-%S )
LOG_FILE_NAME="$LOGS_FOLDER/$LOG_FILE-$TIMESTAMP.log"

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

echo "Script Start Time : $TIMESTAMP" &>>$LOG_FILE_NAME

CHECK_ROOT()
{
    if [ $USERID -ne 0 ]
        then 
            echo -e "$R Error: To execute this script SUDO previlige is required $N"
            exit 1
        else
            echo -e "$G You are a ROOT User. Executing the Script... $N"
    fi
}

CHECK_ROOT

for PACKAGE in $@
do
    dnf list installed $PACKAGE &>>$LOG_FILE_NAME
    if [ $? -ne 0 ]
        then # mysql is not installed
            echo -e "$PACKAGE is Installing ..."
            dnf install $PACKAGE -y &>>$LOG_FILE_NAME
            VALIDATE $? "Installing $PACKAGE"
        else
            echo -e "$PACKAGE is already ... $Y INSTALLED $N"
    fi
done