#!/bin/bash
# 
# created by Sander van Vugt, mail@sandervanvugt.nl
# please send suggestions for improvement to the above email address

clear
ls /root &>/dev/null || (echo run this script with root privileges && exit 2)

#### 
echo -e "\033[1mchecking lab 7.3 results\033[0m"
if vgs | grep vglabs &>/dev/null
then
	echo -e "\033[32m[OK]\033[0m\t\t volume group vglabs was found"
else
	echo -e "\033[31m[FAIL]\033[0m\t\t volume group vglabs was not found"
fi

if lvs | grep lvlabs &>/dev/null
then
	echo -e "\033[32m[OK]\033[0m\t\t logical volume lvlabs was found"
	# needed to check if lvsize is 50% of vgsize
	VGSIZE=$(vgdisplay vglabs | awk '/Total PE/ { print $3 }')
	LVSIZE=$(lvdisplay /dev/vglabs/lvlabs | awk '/Current LE/ { print  $3 }')

	if [[ $(( LVSIZE * 2 + 1 )) == $VGSIZE ]]
	then
        	echo -e "\033[32m[OK]\033[0m\t\t the logical volume lvlabs is set to 50% of the VG size"
	else
        	echo -e "\033[31m[FAIL]\033[0m\t\t the logical volume lvlabs is not set to 50% of the VG size"
	fi
else
	echo -e "\033[31m[FAIL]\033[0m\t\t the logical volume lvlabs was not found"
	echo -e "\t\t\t stopping further evaluation"
	exit 3
fi

# need to find the DM device name to determine filesystem type without mounting it
DMDEV=$(ls -l /dev/vglabs/lvlabs | awk '{ print $NF }')
DMDEV=${DMDEV#*/}

if file -s /dev/$DMDEV | grep -i xfs &>/dev/null
then
        echo -e "\033[32m[OK]\033[0m\t\t the logical volume lvlabs is formatted with an XFS filesystem"
else
        echo -e "\033[31m[FAIL]\033[0m\t\t the logical volume lvlabs is not formatted with an XFS filesystem"
fi

if mount | grep lvlabs &>/dev/null
then
        echo -e "\033[31m[WHAT!?]\033[0m\t the volume lvlabs is mounted! I didn't ask for that!"
fi

