#!/bin/bash
# 
# created by Sander van Vugt, mail@sandervanvugt.nl
# please send suggestions for improvement to the above email address

clear
ls /root &>/dev/null || (echo run this script with root privileges && exit 2)

#### TASK 1
echo -e "\033[1mchecking lab 11.1 results\033[0m"
if grep staff /etc/group | grep sarah | grep zeina &>/dev/null
then
	echo -e "\033[32m[OK]\033[0m\t\t users sarah and zeina exist and are a member of the secondary group staff"
else
	echo -e "\033[31m[FAIL]\033[0m\t\t users sarah and zeina were not found to exist as a member of the group staff"
fi

if grep visitors /etc/group | grep bilal | grep bob &>/dev/null
then
        echo -e "\033[32m[OK]\033[0m\t\t users bilal and bob exist and are a member of the secondary group visitors"
else
        echo -e "\033[31m[FAIL]\033[0m\t\t users bilal and bob were not found to exist as a member of the group visitors"
fi

if [[ $(chage -l bob | awk '/Maximum/  { print $NF }') == 90 ]] &>/dev/null
then
        echo -e "\033[32m[OK]\033[0m\t\t user bob has Max pass age set to 90, so I'm assuming the other users have it as well"
else
        echo -e "\033[31m[FAIL]\033[0m\t\t user bob doesn't have Max Pass age set to 90, so I'm assuming the others also don't"
fi

if grep 99999 /etc/login.defs &>/dev/null
then
        echo -e "\033[32m[OK]\033[0m\t\t good! you didn't change default maximum password age"
else
        echo -e "\033[31m[FAIL]\033[0m\t\t who asked you to change the default maximum password age?!?"
fi

