#!/bin/bash
# 
# created by Sander van Vugt, mail@sandervanvugt.nl
# please send suggestions for improvement to the above email address

clear
ls /root &>/dev/null || (echo run this script with root privileges && exit 2)

#### TASK 1
echo -e "\033[1mchecking lab 9.2 results\033[0m"
if timedatectl status | grep Lusaka &>/dev/null
then
	echo -e "\033[32m[OK]\033[0m\t\t timezone is set to Africa/Lusaka"
else
	echo -e "\033[31m[FAIL]\033[0m\t\t timezone not set to Africa/Lusaka"
fi

if ps aux | grep chrony &>/dev/null
then
	echo -e "\033[32m[OK]\033[0m\t\t the chrony time service is running"
else
	echo -e "\033[31m[FAIL]\033[0m\t\t chrony time service not found to be running"
fi


if grep -E 'pool\t|\spool.ntp.org' /etc/chrony.conf | grep -v '^#' &>/dev/null
then
	echo -e "\033[32m[OK]\033[0m\t\t chronyd client to sync with pool.ntp.org"
else
	echo -e "\033[31m[FAIL]\033[0m\t\t chronyd client not configured to sync with pool.ntp.org"
fi
