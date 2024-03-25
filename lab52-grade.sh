#!/bin/bash
# 
# created by Sander van Vugt, mail@sandervanvugt.nl
# please send suggestions for improvement to the above email address

clear
ls /root &>/dev/null || (echo run this script with root privileges && exit 2)

#### TASK 1
echo -e "\033[1mchecking lab 5.2 results\033[0m"



if [ -x /root/lab52.sh ] &>/dev/null
then
        echo -e "\033[32m[OK]\033[0m\t\t an executable file /root/lab52.sh was found"
else
        echo -e "\033[31m[FAIL]\033[0m\t\t no executable file /root/lab52.sh was found"
fi


if grep '$@' /root/lab52.sh &>/dev/null
then
	echo -e "\033[32m[OK]\033[0m\t\t the script can work with any number of arguments"
else
	echo -e "\033[31m[FAIL]\033[0m\t\t the script cannot work with any number of arguments"
fi


if grep -- -z /root/lab52.sh &>/dev/null
then
	echo -e "\033[32m[OK]\033[0m\t\t the script checks if no arguments were provided"
else
	echo -e "\033[31m[FAIL]\033[0m\t\t the script doesn't check if no arguments were provided"
fi


if grep 'read' /root/lab52.sh &>/dev/null
then
	echo -e "\033[32m[OK]\033[0m\t\t the script prompts for usernames if no arguments were provided"
else
	echo -e "\033[31m[FAIL]\033[0m\t\t the script doesn't prompt for usernames if no arguments were provided"
fi

if grep 'for .* in' /root/lab52.sh &>/dev/null
then
	echo -e "\033[32m[OK]\033[0m\t\t the script uses a for loop to evaluate all users"
else
	echo -e "\033[31m[FAIL]\033[0m\t\t the script doesn't use a for loop to evaluate all users"
fi

if grep '/etc/passwd' /root/lab52.sh &>/dev/null
then
	echo -e "\033[32m[OK]\033[0m\t\t the script checks /etc/passwd for additional user information"
else
	echo -e "\033[31m[FAIL]\033[0m\t\t the script doesn't check /etc/passwd for additional user information"
fi

