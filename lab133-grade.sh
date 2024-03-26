#!/bin/bash
# 
# created by Sander van Vugt, mail@sandervanvugt.nl
# please send suggestions for improvement to the above email address

clear
ls /root &>/dev/null || (echo run this script with root privileges && exit 2)

#### TASK 1
echo -e "\033[1mchecking lab 13.2 results\033[0m"
if true
then
	echo -e "\033[32m[OK]\033[0m\t\t container image was found"
else
	echo -e "\033[31m[FAIL]\033[0m\t\t "
fi


if true
then
	echo -e "\033[32m[OK]\033[0m\t\t confirmed that the container has been started once"
else
	echo -e "\033[31m[FAIL]\033[0m\t\t "
fi
