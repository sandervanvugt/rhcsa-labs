#!/bin/bash
# 
# created by Sander van Vugt, mail@sandervanvugt.nl
# please send suggestions for improvement to the above email address

clear
ls /root &>/dev/null || (echo run this script with root privileges && exit 2)

echo -e "\033[1mchecking lab 5.1 results\033[0m"
if [ -x /root/lab51.sh ]
then
	echo -e "\033[32m[OK]\033[0m\t\t an executable file with the name /lab51.sh was found"
else
	echo -e "\033[31m[FAIL]\033[0m\t\t an executable file with the name /lab51.sh was not found"
fi

if grep read /root/lab51.sh &>/dev/null
then
	echo -e "\033[32m[OK]\033[0m\t\t the script prompts for user input"
else
	echo -e "\033[31m[FAIL]\033[0m\t\t the script doesn't prompt for user input"
fi

if grep 'for i in .*txt' /root/lab51.sh &>/dev/null
then
	echo -e "\033[32m[OK]\033[0m\t\t the script loops over all files that have the .txt extension"
else
	echo -e "\033[31m[FAIL]\033[0m\t\t the script doesn't loop over all files that have the .txt extension"
fi

if grep '${i%.*}' /root/lab51.sh &>/dev/null
then
	echo -e "\033[32m[OK]\033[0m\t\t the script uses pattern matching operators to move the .txt files to .bak files"
else
	echo -e "\033[31m[FAIL]\033[0m\t\t the script doesn't use pattern matching operators to move the .txt files to .bak files"
fi
