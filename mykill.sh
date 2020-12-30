#!/bin/bash

#necessary condition since the user should enter at least one parameter (the program sees the first one)
if [ $# -eq 0 ]
then
    echo "Usage:$0 No parameter has been entered"
    exit 1
fi

fileToKill=$1
pids=$(ps | grep $fileToKill | awk '{print $1}')

for pid in $pids
do
    kill -KILL $pid
done