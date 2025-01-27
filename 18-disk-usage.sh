#!/bin/bash

DISK_USAGE=$(df -hT | grep xfs)
DISK_THRESHOLD=5
MSG=""

while read -r line
do
    USAGE=$(echo $line | awk -F " " '{print $6F}' | cut -d "%" -f1)
    PARTITION=$(echo $line | awk -F " " '{print $NF}')
    #echo "partition: $PARTITION , usage :$USAGE"
    if [ $USAGE -ge $DISK_THRESHOLD ]
    then
        MSG+="HIGH DISK USAGE ON PARTITIION: $PARTITION USAGE: $USAGE \n"
    fi
done <<< $DISK_USAGE

echo "Message: $MSG"
