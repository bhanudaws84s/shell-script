#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "Please run this script with Root access"
    exit 1
fi

dnf list installed mysql

if [ $? -ne 0 ]
then
    dnf install mysql -y
    if [ $? -ne 0 ]
    then
        echo "Installation of MYSQL....Failure"
        exit 1
    else
        echo "Installation of MYSQL....Success"
    fi
else
    echo "Mysql already installed"

fi