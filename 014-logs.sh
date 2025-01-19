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

if [ $USERID -ne 0 ]
    then 
        echo -e "$R Error: To execute this script SUDO previlige is required $N"
        exit 1
    else
        echo -e "$G You are a ROOT User. Executing the Script... $N"
fi

dnf list installed mysql &>>$LOG_FILE_NAME

if [ $? -ne 0 ]
    then # mysql is not installed
        echo -e "MySQL is Installing ..."
        dnf install mysql -y &>>$LOG_FILE_NAME
        VALIDATE $? "Installing MySQL"
    else
        echo -e "MySQL is already ... $Y INSTALLED $N"
fi

dnf list installed git &>>$LOG_FILE_NAME

if [ $? -ne 0 ]
    then # git is not installed
        echo -e "Git is Installing ..."
        dnf install git -y &>>$LOG_FILE_NAME
        VALIDATE $? "Installing GIT"
    else 
        echo -e "GIT is already ... $Y INSTALLED $N"
fi