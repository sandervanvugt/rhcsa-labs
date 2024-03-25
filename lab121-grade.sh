#!/bin/bash
# 
# created by Sander van Vugt, mail@sandervanvugt.nl
# please send suggestions for improvement to the above email address

clear
ls /root &>/dev/null || (echo run this script with root privileges && exit 2)

#### TASK 1
echo -e "\033[1mchecking lab 12.1 results\033[0m"

if ls -ld /data/staff | grep 'd...rwx' &>/dev/null &>/dev/null
then
	echo -e "\033[32m[OK]\033[0m\t\t found correct group permissions on /data/staff"
else
	echo -e "\033[31m[FAIL]\033[0m\t\t didn't find correct group permissions on /data/staff"
	echo -e "\t\t\t if you have set SGID on the directory I fail this lab for you, as you were not asked to do so"
fi

if [[ $(ls -ld /data/staff | cut -d ' ' -f 4) == staff ]] &>/dev/null
then
	echo -e "\033[32m[OK]\033[0m\t\t group staff is set as owner of /data/staff"
else
	echo -e "\033[31m[FAIL]\033[0m\t\t group staff is not set as owner of /data/staff"
fi

if ls -ld /data/staff | grep 'r-t' &>/dev/null
then
	echo -e "\033[32m[OK]\033[0m\t\t sticky bit has set to /data/staff"
else
	echo -e "\033[31m[FAIL]\033[0m\t\t sticky bit was not set to /data/staff"
fi


if lsattr /data/staff/rootfile | grep -- '----i' &>/dev/null
then
	echo -e "\033[32m[OK]\033[0m\t\t /data/staff/rootfile cannot be modified by anyone"
else
	echo -e "\033[31m[FAIL]\033[0m\t\t /data/staff/rootfile cannot be modified by anyone"
fi
