#!/bin/bash
# 
# created by Sander van Vugt, mail@sandervanvugt.nl
# please send suggestions for improvement to the above email address

clear
ls /root &>/dev/null || (echo run this script with root privileges && exit 2)

#### TASK 1
echo -e "\033[1mchecking lab 13.1 results\033[0m"
if podman login --get-login
then
	echo -e "\033[32m[OK]\033[0m\t\t you are logged in to the Red Hat registries"
else
	echo -e "\033[31m[FAIL]\033[0m\t\t you don't seem to be logged in to the Red Hat Registries"
fi

if podman ps | grep 'bitnami/nginx' | grep '81->8080'
then
	echo -e "\033[32m[OK]\033[0m\t\t the bitnami/nginx image is running and accessible on host port 81"
else
	echo -e "\033[31m[FAIL]\033[0m\t\t the bitnami/nginx image doesn't seem to be running and accessible on host port 81"
fi
