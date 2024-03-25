#!/bin/bash
# 
# created by Sander van Vugt, mail@sandervanvugt.nl
# please send suggestions for improvement to the above email address

clear
ls /root &>/dev/null || (echo run this script with root privileges && exit 2)

#### TASK 1
echo -e "\033[1mchecking lab 12.2 results\033[0m"
if ps aux | grep ftp &>/dev/null
then
	echo -e "\033[32m[OK]\033[0m\t\t ithe vsftpd service is running"
else
	echo -e "\033[31m[FAIL]\033[0m\t\t can't find a running vsftpd service"
fi

if ls -ld /var/ftp/pub | grep 'drwxrwxrwx' &>/dev/null
then
	echo -e "\033[32m[OK]\033[0m\t\t /var/ftp/pub has sufficient permissions"
else
	echo -e "\033[31m[FAIL]\033[0m\t\t permissions not correctly set on /var/ftp/pub"
fi

if grep '^anonymous_enable=YES' /etc/vsftpd/vsftpd.conf &>/dev/null
then
	echo -e "\033[32m[OK]\033[0m\t\t anonymous FTP server access is allowed"
else
	echo -e "\033[31m[FAIL]\033[0m\t\t anonymous FTP server access is not allowed"
fi

if grep '^anon_upload_enable=YES' /etc/vsftpd/vsftpd.conf &>/dev/null
then
	echo -e "\033[32m[OK]\033[0m\t\t anonymous uploads allowed by vsftpd"
else
	echo -e "\033[31m[FAIL]\033[0m\t\t anonymous uploads not allowed by vsftpd"
fi

if semanage boolean -l | grep 'ftpd_anon_write.*(on.*,.*on)' &>/dev/null
then
	echo -e "\033[32m[OK]\033[0m\t\t the ftpd_anon_write boolean is configured correctly"
else
	echo -e "\033[31m[FAIL]\033[0m\t\t the ftpd_anon_write boolean is not configured correctly"
fi

if ls -dZ /var/ftp/pub | grep public_content_rw_t &>/dev/null
then
	echo -e "\033[32m[OK]\033[0m\t\t file context on /var/ftp/pub is configured correctly"
else
	echo -e "\033[31m[FAIL]\033[0m\t\t file context on /var/ftp/pub is not configured correctly"
fi
