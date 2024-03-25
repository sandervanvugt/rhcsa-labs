#!/bin/bash
# 
# created by Sander van Vugt, mail@sandervanvugt.nl
# please send suggestions for improvement to the above email address

clear
ls /root &>/dev/null || (echo run this script with root privileges && exit 2)

#### TASK 1
echo -e "\033[1mchecking lab 9.1 results\033[0m" &>/dev/null
if crontab -l -u linda
then
	echo -e "\033[32m[OK]\033[0m\t\t found a cronjob for user linda"
else
	echo -e "\033[31m[FAIL]\033[0m\t\t didn't find a cronjob for user linda"
fi

if crontab -l -u linda | grep logger &>/dev/null
then
	echo -e "\033[32m[OK]\033[0m\t\t confirmed that the cronjob uses logger to write to syslog"
else
	echo -e "\033[31m[FAIL]\033[0m\t\t cronjob doesn't use logger to write to syslog"
fi

if crontab -l -u linda | grep '0 2 * * ...' &>/dev/null
then
	echo -e "\033[32m[OK]\033[0m\t\t confirmed that the cronjob runs at 2 AM"
else
	echo -e "\033[31m[FAIL]\033[0m\t\t cronjob isn't scheduled to run at 2 AM"
fi
