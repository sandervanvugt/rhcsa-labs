#!/bin/bash
# 
# created by Sander van Vugt, mail@sandervanvugt.nl
# please send suggestions for improvement to the above email address

clear
ls /root &>/dev/null || (echo run this script with root privileges && exit 2)

#### TASK 1
echo -e "\033[1mchecking lab 11.2 results\033[0m"
if passwd -S sarah | grep locked &>/dev/null &>/dev/null
then
	echo -e "\033[32m[OK]\033[0m\t\t password for user sarah is locked"
else
	echo -e "\033[31m[FAIL]\033[0m\t\t password for user sarah doesn't seem to be locked"
fi


if chage -l bob | grep 'Jan.*01,.*2032' &>/dev/null
then
	echo -e "\033[32m[OK]\033[0m\t\t account for user bob will expire Jan. 1st 2032"
else
	echo -e "\033[31m[FAIL]\033[0m\t\t account for user bob not set to expire on Jan. 1st 2032"
fi

if grep '^ENCRYPT_METHOD.*SHA256' /etc/login.defs &>/dev/null
then
	echo -e "\033[32m[OK]\033[0m\t\t password encryption algorithm set to SHA256"
else
	echo -e "\033[31m[FAIL]\033[0m\t\t password encryption algorithm not set to SHA256"
fi


if grep 'PASS_MAX_DAYS.*120' /etc/login.defs &>/dev/null
then
	echo -e "\033[32m[OK]\033[0m\t\t echo password expiration for new users is set to 120 days"
else
	echo -e "\033[31m[FAIL]\033[0m\t\t echo password expiration for new users is not set to 120 days"
fi
