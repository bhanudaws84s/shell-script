#!/bin/bash

echo "All variables passed : $@"
echo "No.of variables : $#"
echo "The script name : $0"
echo "Present working directory : $PWD"
echo "Which user is running this script : $USER"
echo "Home directory : $HOME"
echo "process instance id : $$"
sleep 60 &
echo "process id of last cmd in background : $!"

