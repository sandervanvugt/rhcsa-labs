#!/bin/bash
# 
# created by Sander van Vugt, mail@sandervanvugt.nl
# please send suggestions for improvement to the above email address

clear
ls /root &>/dev/null || (echo run this script with root privileges && exit 2)

#### TASK 1
echo -e "\033[1mchecking lab 7.4 results\033[0m"
if [ -f /swapfile ] &>/dev/null
then
	echo -e "\033[32m[OK]\033[0m\t\t found the file /swapfile"
	if ls -l /swapfile | grep '.rw-------' &>/dev/null
	then
		echo -e "\033[32m[OK]\033[0m\t\t /swapfile has correct permissions set"
	else
		echo -e "\033[31m[FAIL]\033[0m\t\t /swapfile doesn't have the right permissions set"
	fi
	if file /swapfile | grep -i 'Linux swap file' &>/dev/null
	then
		echo -e "\033[32m[OK]\033[0m\t\t /swapfile is correctly formatted as swap"
	else
		echo -e "\033[31m[FAIL]\033[0m\t\t /no swap filesystem found on /swapfile"
	fi
else
	echo -e "\033[31m[FAIL]\033[0m\t\t file /swapfile not found"
fi

if grep swapfile /etc/fstab &>/dev/null
then
	echo -e "\033[32m[OK]\033[0m\t\t found persistet mount configuration for /swapfile"
else
	echo -e "\033[31m[FAIL]\033[0m\t\t found no persistent mount configuration for /swapfile"
fi

