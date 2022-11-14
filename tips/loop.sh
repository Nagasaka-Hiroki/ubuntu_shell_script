#!/bin/bash
num=0
t=3
while [ "true" ]
do
    echo $num
    num=$(($num+$t))
    sleep $t
done
