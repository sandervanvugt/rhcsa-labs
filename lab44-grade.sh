#!/bin/bash
# 
# created by Sander van Vugt, mail@sandervanvugt.nl
# please send suggestions for improvement to the above email address

clear
ls /root &>/dev/null || (echo run this script with root privileges && exit 2)

#### TASK 1
echo -e "\033[1mchecking lab 4.4 results\033[0m"
find / -size +100M -type f -exec ls -l {} \; > /tmp/lab44.txt 2>/dev/null
if diff /tmp/bigfiles /tmp/lab44.txt &>/dev/null
then
	echo -e "\033[32m[OK]\033[0m\t\t you have correctly idenitified files bigger than 100M"
else
	echo -e "\033[31m[FAIL]\033[0m\t\t you have not correctly identified files bigger than 100M"
fi

