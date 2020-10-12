#!/bin/bash
# Script to automate logging process
# Author: alifyandra

cd ../../TXT/

printf "Please enter What week you wish to log.\n"
printf "e.g. 'W01'/'W03'\n"

read week

printf "Would you like to see the logcodes list? (Y/N)\n"
read list

if [[ $list == "Y" || $list == "y" ]]; then
	printf "\nFetching Log Code list from OS Website. \n"
	sleep 1
	printf "Please wait...\n"
	curl https://osp4diss.vlsm.org/ETC/logCodes.txt || wget -qO - https://osp4diss.vlsm.org/ETC/logCodes.txt
fi

printf "Enter a logcode: \n"
printf "e.g. 'L01'/'L20'\n"
read code

printf "How many minutes did this activity take?\n"
printf "e.g."
read time
timelen=$(echo -n "$time" | wc -c)

if [ $timelen -eq 1 ];then 
	time="  $time"
elif [ $timelen -eq 2 ];then
	time=" $time"
else 
	time="$time"
fi

printf "Please enter a short description of it:\n"
read desc

printf "Would you like to add this to your log? (Y/N)\n"
printf "ZCZC $week $time $code $desc\n"
read add

if [[ $add == "Y" || $add == "y" ]]; then
	printf "ZCZC $week $time $code $desc\n" >> mylog.txt
	printf "\nSuccessfully added!\n\n"
	sleep 1
	printf "Would you like to log again? (Y/N)\n"
	read again
	if [[ $again == "Y" || $again == "y" ]]; then
		bash $0
	fi
	printf "Bye!"
else
	printf "Would you like to log again? (Y/N)\n"
	read again
	if [[ $again == "Y" || $again == "y" ]]; then
		bash $0
	fi
	printf "Bye!"
fi


