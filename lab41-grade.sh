#!/bin/bash
# 
# created by Sander van Vugt, mail@sandervanvugt.nl
# please send suggestions for improvement to the above email address

clear
ls /root &>/dev/null || (echo run this script with root privileges && exit 2)

#### TASK 1
echo -e "\033[1mchecking lab 4.1 results\033[0m"
if grep -qil repository.example.com /etc/yum.repos.d/*
then
	REPOFILE=$(grep -il repository.example.com /etc/yum.repos.d/*)
	echo -e "\033[32m[OK]\033[0m\t\t Found the file $REPOFILE that uses repository.example.com"
else
	echo -e "\033[31m[FAIL]\033[0m\t\t No repository file that refers to repository.example.com was found"
	exit 6
fi

if grep -iq 'enabled=0' $REPOFILE || grep -iq 'enabled=no' $REPOFILE
then
	echo -e "\033[32m[OK]\033[0m\t\t the repository.example.com repository is not currently enabled"
else
	echo -e "\033[31m[FAIL]\033[0m\t\t the repository.example.com repository seems to be enabled"
fi

if grep -iq 'gpgcheck=0' $REPOFILE
then
	echo -e "\033[32m[OK]\033[0m\t\t the repository.example.com repository has GPG checking disabled"
else
	echo -e "\033[31m[FAIL]\033[0m\t\t the repository.example.com repository has GPG checking enabled"
fi

