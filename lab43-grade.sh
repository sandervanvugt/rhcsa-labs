#!/bin/bash
# 
# created by Sander van Vugt, mail@sandervanvugt.nl
# please send suggestions for improvement to the above email address

clear
ls /root &>/dev/null || (echo run this script with root privileges && exit 2)

#### TASK 1
echo -e "\033[1mchecking lab 4.3 results\033[0m"
if [ -d /data/profs ] &>/dev/null
then
	echo -e "\033[32m[OK]\033[0m\t\t directory /data/profs exists"
else
	echo -e "\033[31m[FAIL]\033[0m\t\t no directory /data/profs was found. exiting now."
	exit 3
fi

if id linda &>/dev/null
then
	echo -e "\033[32m[OK]\033[0m\t\t user linda exists"
	if id linda | grep profs &>/dev/null
	then
        	echo -e "\033[32m[OK]\033[0m\t\t user linda is a member of the group profs"
	else
       		echo -e "\033[31m[FAIL]\033[0m\t\t user linda is not a member of the group profs"
	fi
else
	echo -e "\033[31m[FAIL]\033[0m\t\t user linda doesn't exist"
fi


if ls -ld /data/profs | grep linda &>/dev/null
then
	echo -e "\033[32m[OK]\033[0m\t\t user linda is owner of the directory /data/profs so she can change permissions"
	if ls -ld /data/profs | grep 'd---' &>/dev/null
	then
        	echo -e "\033[32m[OK]\033[0m\t\t user linda does not have read or write permissions on /data/profs"
	else
       		echo -e "\033[31m[FAIL]\033[0m\t\t user linda has too many permissions on /data/profs"
	fi
else
	echo -e "\033[31m[FAIL]\033[0m\t\t user linda is not owner of the directory /data/profs so she cannot change its permissions"
fi


if [[ $(ls -ld /data/profs | awk '{ print $4 }') == profs ]]  &>/dev/null
then
	echo -e "\033[32m[OK]\033[0m\t\t directory /data/profs is owned by the group profs"
else
	echo -e "\033[31m[FAIL]\033[0m\t\t directory /data/profs is not owned  by the group profs"
fi


if ls -ld /data/profs | grep 'd...rwx---' &>/dev/null
then
	echo -e "\033[32m[OK]\033[0m\t\t others has no permissions on /data/profs"
else
	echo -e "\033[31m[FAIL]\033[0m\t\t others has too many permissions on /data/profs"
fi
