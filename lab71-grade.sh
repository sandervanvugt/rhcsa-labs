#!/bin/bash
# 
# created by Sander van Vugt, mail@sandervanvugt.nl
# please send suggestions for improvement to the above email address

clear
ls /root &>/dev/null || (echo run this script with root privileges && exit 2)

#### TASK 1
echo -e "\033[1mchecking lab 7.1 results\033[0m"
MYDISK=$(lsblk | grep disk | sed -n '1p' | awk '{ print $1 }')
if fdisk -l /dev/$MYDISK | grep Extended &>/dev/null
then
	echo -e "\033[32m[OK]\033[0m\t\t an extended partition was found"
else
	echo -e "\033[31m[FAIL]\033[0m\t\t no extended partition was found"
fi


if grep EXTFILES /etc/fstab &>/dev/null
then
	echo -e "\033[32m[OK]\033[0m\t\t logical partition mount found in /etc/fstab"
else
	echo -e "\033[31m[FAIL]\033[0m\t\t logical partition mount not found in /etc/fstab"
fi

if [ -d /mnt/data ] &>/dev/null
then
	echo -e "\033[32m[OK]\033[0m\t\t directory /mnt/data was found"
else
	echo -e "\033[31m[FAIL]\033[0m\t\t directory /mnt/data was not found"
fi

if mount | grep '/mnt/data' | grep ext4 &>/dev/null
then
	echo -e "\033[32m[OK]\033[0m\t\t the filesystem is currently  mounted on /mnt/data"
else
	echo -e "\033[31m[FAIL]\033[0m\t\t the filesystem is not currently mounted on /mnt/data"
fi
