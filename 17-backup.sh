#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

SOURCE_DIR=$1
DEST_DIR=$2
DAYS=${3:-14} # if user is not providing number of days, we are taking 14 as default

LOGS_FOLDER="/home/ec2-user/shell-logs"
LOG_FILE=$(echo $0 | awk -F "/" '{print $NF}' | cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE_NAME="$LOGS_FOLDER/$LOG_FILE-$TIMESTAMP.log"

USAGE(){
    echo -e "$R USAGE :: $N sh 17-backup.sh <SOURCE DIR> <DEST DIR> <DAYS(OPTIONAL)>"
    exit 1
}

mkdir -p /home/ec2-user/shell-logs/

if [ $# -lt 2 ]
then
    USAGE
fi

if [ ! -d $SOURCE_DIR ]
then
    echo -e "$R $SOURCE_DIR Does not exist...Please check $N"
    exit 1
fi

if [ ! -d $DEST_DIR ]
then
    echo -e "$R $DEST_DIR Does not exist...Please check $N"
    exit 1
fi

echo "Script started executing at: $TIMESTAMP" &>>$LOG_FILE_NAME
FILES=$(find $SOURCE_DIR -name "*.log" -mtime +$DAYS)
echo "Files are : $FILES"

