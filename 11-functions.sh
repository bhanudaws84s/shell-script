#!/bin/bash

USERID=$(id -u)

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo "$2 ... failure"
        exit 1
    else
        echo "$2 ... Success"
    fi
}

if [ $USERID -ne 0 ]
then
    echo "ERROR :: Please run this script with root access"
    exit 1
fi

dnf list installed mysql

if [ $? -ne 0 ]
then
    dnf install mysql -y
    VALIDATE $? "Installing MYSQL"
else
    echo "MySQL already installed"
fi

dnf list installed git

if [ $? -ne 0 ]
then
    dnf install git -y
    VALIDATE $? "Installing git"
else
    echo "git already installed"
fi

