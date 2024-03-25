#!/bin/bash
# 
# created by Sander van Vugt, mail@sandervanvugt.nl
# please send suggestions for improvement to the above email address

clear
ls /root &>/dev/null || (echo run this script with root privileges && exit 2)

#### TASK 1
echo -e "\033[1mchecking lab 6.2 results\033[0m"
if tuned-adm profile | grep active | grep powersave &>/dev/null
then
	echo -e "\033[32m[OK]\033[0m\t\t the powersave tuned profile is set"
else
	echo -e "\033[31m[FAIL]\033[0m\t\t the powersave tuned profile is not set"
fi

