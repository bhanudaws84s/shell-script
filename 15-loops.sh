#!/bin/bash

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOGS_FOLDER="/var/log/shell-script-logs"
LOG_FILE=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE_NAME="$LOGS_FOLDER/$LOG_FILE-$TIMESTAMP.log"

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e "$2 is $R failure $N"
        exit 1
    else
        echo "$2 is $G success $N" 
    fi
}


CHECK_ROOT(){
    if [ $USERID -ne 0 ]
    then
        echo -e "$R ERROR :: Please run this script with sudo access $N"
        exit 1
    fi

}
echo "Script started executing at: $TIMESTAMP" &>>$LOG_FILE_NAME
CHECK_ROOT

for package in $@
do

    if [ $? -ne 0 ]
    then
        dnf install $package -y &>>$LOG_FILE_NAME
        VALIDATE $? "Installing $package"

    else
        echo -e "$Y $package already installed $N"

    fi

done



