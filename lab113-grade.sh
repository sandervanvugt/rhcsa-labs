#!/bin/bash
# 
# created by Sander van Vugt, mail@sandervanvugt.nl
# please send suggestions for improvement to the above email address

clear
ls /root &>/dev/null || (echo run this script with root privileges && exit 2)

#### TASK 1
echo -e "\033[1mchecking lab 11.3 results\033[0m"

if grep zeina /etc/sudoers &>/dev/null || grep zeina /etc/sudoers.d/* &>/dev/null
then
	if grep 'zeina.*/usr/bin/passwd,.*!.*/usr/bin/passwd root' /etc/sudoers &>/dev/null
	then
		echo -e "\033[32m[OK]\033[0m\t\t sudoers configuration for user zeina was found" 
	fi
	if grep 'zeina.*/usr/bin/passwd,.*!.*/usr/bin/passwd root' /etc/sudoers.d/* &>/dev/null
	then
		echo -e "\033[32m[OK]\033[0m\t\t sudoers configuration for user zeina was found"
	fi 
else
	echo -e "\033[31m[FAIL]\033[0m\t\t sudoers configuration for user zeina is not found"
fi


if id sarah | grep wheel &>/dev/null
then
	echo -e "\033[32m[OK]\033[0m\t\t user sarah is a member of the group wheel which gives her full sudo access"
elif grep sarah /etc/sudoers &>/dev/null || grep sarah /etc/sudoers.d/* &>/dev/null
then
	echo -e "\033[36m[OK-ish]\033[0m\t a sudo configuration was found for user sarah in sudoers."
	echo -e "\t\t to give full sudo access better make the user a member of the group wheel."
else
	echo -e "\033[31m[FAIL]\033[0m\t\t no sudo configuration found for user sarah."
fi
