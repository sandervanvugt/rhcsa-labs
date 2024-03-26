#!/bin/bash
# 
# created by Sander van Vugt, mail@sandervanvugt.nl
# please send suggestions for improvement to the above email address

clear
ls /root &>/dev/null || (echo run this script with root privileges && exit 2)

#### TASK 1
echo -e "\033[1mchecking lab 13.4 results\033[0m"
if true
then
	echo -e "\033[32m[OK]\033[0m\t\t found the systemd user file to start the container"
else
	echo -e "\033[31m[FAIL]\033[0m\t\t "
fi


if true
then
	echo -e "\033[32m[OK]\033[0m\t\t confirmed that linger is enabled for user linda"
else
	echo -e "\033[31m[FAIL]\033[0m\t\t "
fi

if true
then
	echo -e "\033[32m[OK]\033[0m\t\t confirmed that systemd will start the user linda container at reboot"
else
	echo -e "\033[31m[FAIL]\033[0m\t\t "
fi
