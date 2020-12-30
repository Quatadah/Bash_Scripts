#!/bin/bash

fileToKill=$1
pids=$(ps | grep $fileToKill | awk '{print $1}')

for pid in $pids
do
    kill -KILL $pid
done