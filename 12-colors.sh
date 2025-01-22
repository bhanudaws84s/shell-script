#!/bin/bash

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e "$2 is $R failure $N"
        exit 1
    else
        echo "$2 is $G success $N" 
    fi
}

if [ $USERID -ne 0 ]
then
    echo -e "$R ERROR :: Please run this script with sudo access $N"
    exit 1
fi

dnf list installed mysql

if [ $? -ne 0 ]
then
    dnf install mysql -y
    VALIDATE $? "Installing Mysql"

else
    echo -e "$Y Mysql already installed $N"

fi

dnf list installed git
if [ $? -ne 0 ]
then   
    dnf install git -y
    VALIDATE $? "Installing Git"
else
    echo -e "$Y Git already installed $N"

fi


