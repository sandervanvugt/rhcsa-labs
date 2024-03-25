#!/bin/bash
# 
# created by Sander van Vugt, mail@sandervanvugt.nl
# please send suggestions for improvement to the above email address

clear
ls /root &>/dev/null || (echo run this script with root privileges && exit 2)

#### TASK 1
echo -e "\033[1mchecking lab 4.2 results\033[0m"
if ls /rhel9.iso &>/dev/null && file /rhel9.iso | grep -i iso &>/dev/null
then
	echo -e "\033[32m[OK]\033[0m\t\t an iso file with the name /rhel9.iso was found"
	if [[ $(ls -l /rhel9.iso | awk '{ print $5 }') -lt 1000000000 ]] &>/dev/null
	then
		echo -e "\033[31m[WARNING]\033[0m\t the iso file is smaller than 1GB. That is surprisingly small, you might experience issues with it"
	fi
else
	echo -e "\033[31m[FAIL]\033[0m\t\t no iso file with the name /rhel9.iso was found"
fi

if mount | grep repo | grep rhel9 &>/dev/null &>/dev/null
then
	echo -e "\033[32m[OK]\033[0m\t\t the rhel9.iso file is mounted on /repo"
	if grep rhel9.iso /etc/fstab &>/dev/null
	then
		echo -e "\033[32m[OK\033[0m\t\t persistent mount found in /etc/fstab"
	else
		echo -e "\033[31m[FAIL]\033[0m\t\t persistent mount not found in /etc/fstab"
	fi
else
	echo -e "\033[31m[FAIL]\033[0m\t\t the rhel9.iso file is not mounted on /repo"
fi

if grep 'file:///repo/BaseOS' /etc/yum.repos.d/* &>/dev/null
then
	BASEOSFILE=$(grep -l 'file:///repo/BaseOS' /etc/yum.repos.d/*)
	echo -e "\033[32m[OK]\033[0m\t\t the /repo/BaseOS directory is used as a repository"
	if grep 'gpgcheck=0' $BASEOSFILE &>/dev/null
	then
		echo -e "\033[32m[OK]\033[0m\t\t gpgcheck set to disabled in $BASEOSFILE"
	else
		echo -e "\033[31m[FAIL]\033[0m\t\t gpgcheck is not disabled in $BASEOSFILE. Therefore, the repository won't work."
	fi
else
	echo -e "\033[31m[FAIL]\033[0m\t\t no repository configuration for /repo/BaseOS was found"
fi

if grep 'file:///repo/AppStream' /etc/yum.repos.d/* &>/dev/null
then
	APPSTREAMFILE=$(grep -l 'file:///repo/AppStream' /etc/yum.repos.d/*)
	echo -e "\033[32m[OK]\033[0m\t\t the /repo/AppStream directory is used as a repository"
	if grep 'gpgcheck=0' $APPSTREAMFILE &>/dev/null
        then
                echo -e "\033[32m[OK]\033[0m\t\t gpgcheck set to disabled in $APPSTREAMFILE"
        else
                echo -e "\033[31m[FAIL]\033[0m\t\t gpgcheck is not disabled in $APPSTREAMFILE. Therefore, the repository won't work."
        fi
else
        echo -e "\033[31m[FAIL]\033[0m\t\t no repository configuration for /repo/AppStream was found"
fi


