#!/bin/bash
# 
# created by Sander van Vugt, mail@sandervanvugt.nl
# please send suggestions for improvement to the above email address

clear
ls /root &>/dev/null || (echo run this script with root privileges && exit 2)

#### TASK 1
echo -e "\033[1mchecking lab 10.2 results\033[0m"
if hostnamectl hostname | grep examlabs.local &>/dev/null
then
	echo -e "\033[32m[OK]\033[0m\t\t hostname is set to examlabs.local"
else
	echo -e "\033[31m[FAIL]\033[0m\t\t hostname is not set to examlabs.local"
fi

IPADDR=$(ip a | grep -A 3 '^2' | awk '/inet/ { print $2 }')
IPADDR=${IPADDR%/*}
if grep '${IPADDR}[[:space:]]*examlabs.local' /etc/hosts &>/dev/null
then
	echo -e "\033[32m[OK]\033[0m\t\t /etc/hosts has an entry that resolves current IP to examlabs.local"
else
	echo -e "\033[31m[FAIL]\033[0m\t\t /etc/hosts doesn't have an entry that resolves current IP to examlabs.local"
fi
