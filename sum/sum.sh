#!/bin/bash

#the program sums in each line the parameters entered by the user 

#the first condition as usual ( at least two parameters)

if [ $# -le 1 ]
then
    echo "Usage:$0 you need to enter at least two parameters."
    exit 1
fi

previousSum=$1

while [ $# -ge 2 ]
do

    echo -n "$previousSum + $2 = "
    sum=$(($previousSum+$2))
    echo $sum
    previousSum=$sum
    shift
done


