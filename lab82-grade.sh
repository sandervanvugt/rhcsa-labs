#!/bin/bash
# 
# created by Sander van Vugt, mail@sandervanvugt.nl
# please send suggestions for improvement to the above email address

clear
ls /root &>/dev/null || (echo run this script with root privileges && exit 2)

#### TASK 1
echo -e "\033[1mchecking lab 8.2 results\033[0m"
if systemctl is-enabled autofs &>/dev/null
then
	echo -e "\033[32m[OK]\033[0m\t\t the autofs service is enabled"
else
	echo -e "\033[31m[FAIL]\033[0m\t\t the autofs service is not enabled"
fi

if grep '/start' /etc/auto.master &>/dev/null
then
	echo -e "\033[32m[OK]\033[0m\t\t found a line for the /start directory in /etc/auto.master"
else
	echo -e "\033[31m[FAIL]\033[0m\t\t didn't find a line for the /start directory in /etc/auto.master"
fi

if grep 'files.*sda1' /etc/auto.start &>/dev/null
then
	echo -e "\033[32m[OK]\033[0m\t\t found a line that automounts /dev/sda1 on /start/files"
else
	echo -e "\033[31m[FAIL]\033[0m\t\t didn't find a line that automounts /dev/sda1 on /start/files"
fi

if touch /start/files/hello &>/dev/null
then
	echo -e "\033[32m[OK]\033[0m\t\t successfully wrote a file to the automounted directory"
else
	echo -e "\033[31m[FAIL]\033[0m\t\t wasn't able to write a file to the automounted directory"
fi
