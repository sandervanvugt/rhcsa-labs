#!/bin/bash
# 
# created by Sander van Vugt, mail@sandervanvugt.nl
# please send suggestions for improvement to the above email address

clear
ls /root &>/dev/null || (echo run this script with root privileges && exit 2)

#### TASK 1
echo -e "\033[1mchecking lab 8.4 results\033[0m"
if grep sales /etc/group | grep lisa | grep lori &>/dev/null
then
	echo -e "\033[32m[OK]\033[0m\t\t found a group sales with members lisa and lori"
else
	echo -e "\033[31m[FAIL]\033[0m\t\t didn't find a group sales with members lisa and lori"
fi

if ls -ld /data/sales | grep 'd...rws' &>/dev/null
then
	echo -e "\033[32m[OK]\033[0m\t\t found correct group permissions on /data/sales"
else
	echo -e "\033[31m[FAIL]\033[0m\t\t didn't find correct group permissions on /data/sales"
fi

if ls -ld /data/sales | grep 'd......r-t' &>/dev/null
then
	echo -e "\033[32m[OK]\033[0m\t\t found sticky bit set on /data/sales"
else
	echo -e "\033[31m[FAIL]\033[0m\t\t didn't find sticky bit set on /data/sales"
fi

if ls -ld /data/sales | grep lisa &>/dev/null
then
	echo -e "\033[32m[OK]\033[0m\t\t user lisa set as owner of /data/sales, which allows her to delete files"
else
	echo -e "\033[31m[FAIL]\033[0m\t\t didn't find user lisa set as owner of /data/sales, which would allow her to delete files"
fi
