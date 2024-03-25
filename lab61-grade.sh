#!/bin/bash
# 
# created by Sander van Vugt, mail@sandervanvugt.nl
# please send suggestions for improvement to the above email address

clear
ls /root &>/dev/null || (echo run this script with root privileges && exit 2)

#### TASK 1
echo -e "\033[1mchecking lab 6.1 results\033[0m"
if rpm -qa | grep -E '^http|^nginx' &>/dev/null
then
	echo -e "\033[32m[OK]\033[0m\t\t packages httpd and nginx are installed"
else
	echo -e "\033[31m[FAIL]\033[0m\t\t cannot find both the httpd and nginx packages"
fi

if systemctl status nginx | grep masked &>/dev/null
then
	echo -e "\033[32m[OK]\033[0m\t\t the nginx service is masked and cannot be started"
else
	echo -e "\033[31m[FAIL]\033[0m\t\t the nginx service is not masked and can still be started"
fi

if systemctl status httpd | grep -i enabled &>/dev/null
then
	echo -e "\033[32m[OK]\033[0m\t\t the httpd service is enabled and will be started on system boot"
else
	echo -e "\033[31m[FAIL]\033[0m\t\t the httpd service is not started and will not be started at system boot"
fi

if systemctl show httpd | grep RestartUSec=21s &>/dev/null
then
	echo -e "\033[32m[OK]\033[0m\t\t the httpd service is not configured to restart after 21 seconds if it fails"
else
	echo -e "\033[31m[FAIL]\033[0m\t\t the httpd service is configured to restart after 21 seconds if it fails"
fi
