#!/bin/bash
# 
# created by Sander van Vugt, mail@sandervanvugt.nl
# please send suggestions for improvement to the above email address

clear
ls /root &>/dev/null || (echo run this script with root privileges && exit 2)

#### TASK 1
echo -e "\033[1mchecking lab 10.1 results\033[0m"
if firewall-cmd --list-all | grep http | grep https &>/dev/null
then
	echo -e "\033[32m[OK]\033[0m\t\t confirmed that firewalld allows incoming traffic to http as well as https"
else
	echo -e "\033[31m[FAIL]\033[0m\t\t cannot confirm that firewall allows incoming traffic to http and https"
fi

