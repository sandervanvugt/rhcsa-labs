#!/bin/bash
# 
# created by Sander van Vugt, mail@sandervanvugt.nl
# please send suggestions for improvement to the above email address

clear
ls /root &>/dev/null || (echo run this script with root privileges && exit 2)

#### TASK 1
echo -e "\033[1mchecking task 1 results\033[0m"
if grep 'AllowUsers.*student' /etc/ssh/sshd_config | grep linda &>/dev/null
then
	echo -e "\033[32m[OK]\033[0m\t\t only users linda and student are allowed to login through SSH"
else
	echo -e "\033[31m[FAIL]\033[0m\t\t no restriction found to limit user login on SSH to student and linda only"
fi
