#!/bin/bash
# 
# created by Sander van Vugt, mail@sandervanvugt.nl
# please send suggestions for improvement to the above email address

clear
ls /root &>/dev/null || (echo run this script with root privileges && exit 2)

#### TASK 1
echo -e "\033[1mchecking lab 8.3 results\033[0m"
VGNAME=$(lvs | awk '/root/ { print $2 }')
if [[ $(lvdisplay /dev/cs/root | awk '/Segment/ { print $2 }') == 2 ]]
then
	echo -e "\033[32m[OK]\033[0m\t\t found 2 physical volumes in the root LV"
else
	echo -e "\033[31m[FAIL]\033[0m\t\t didn't find more than 1 physical volume in the root LV"
fi

