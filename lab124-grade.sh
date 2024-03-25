#!/bin/bash
# 
# created by Sander van Vugt, mail@sandervanvugt.nl
# please send suggestions for improvement to the above email address

clear
ls /root &>/dev/null || (echo run this script with root privileges && exit 2)

#### TASK 1
echo -e "\033[1mchecking task 12.4 results\033[0m"
if grep 'Listen.*82' /etc/httpd/conf/httpd.conf &>/dev/null
then
	echo -e "\033[32m[OK]\033[0m\t\t httpd is configured to listen on port 82 only"
else
	echo -e "\033[31m[FAIL]\033[0m\t\t the Listen parameter in /etc/httpd/conf/httpd.conf is not set to allow httpd access on port 82"
fi

if semanage port -l | grep 82 | grep http &>/dev/null
then
	echo -e "\033[32m[OK]\033[0m\t\t SELinux allows the httpd service to bind to TCP port 82"
else
	echo -e "\033[31m[FAIL]\033[0m\t\t SELinux doesn't allow the httpd service to bind to TCP port 82"
fi
