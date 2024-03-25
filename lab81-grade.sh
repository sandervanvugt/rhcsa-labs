#!/bin/bash
# 
# created by Sander van Vugt, mail@sandervanvugt.nl
# please send suggestions for improvement to the above email address

clear
ls /root &>/dev/null || (echo run this script with root privileges && exit 2)

#### TASK 1
echo -e "\033[1mchecking lab 8.1 results\033[0m"
if grep 'noexec' /etc/fstab | grep lvlabs && grep 'noatime' /etc/fstab | grep lvlabs
then
	echo -e "\033[32m[OK]\033[0m\t\t found a mount for /lvlabs where the noexec and noatime options have been set"
else
	echo -e "\033[31m[FAIL]\033[0m\t\t did find a mount for /lvlabs where the noexec and noatime options have been set"
fi
