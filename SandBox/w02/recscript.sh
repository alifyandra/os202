#!/bin/bash

printf "before recursive"
printf "recursive? (y/n)"
read rec

if [ $rec == "y" ]; then
    bash recscript.sh
    printf "text in if after recursion"
fi
printf "text outside loop after recursion"