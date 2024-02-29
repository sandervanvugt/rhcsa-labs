if lsblk | grep disk  | sed -n '2p' | awk '{ print $1 }' | grep .db &>/dev/null
then
	PART=sdb1
	if mount | grep sdb1 | grep -i xfs &>/dev/null
	then
		echo -e "\033[32m[OK]\033[0m\t\t \033[1m/dev/sdb1\033[0m is mounted with the xfs filesystem on \033[1m/data\033[0m"
		SCORE=$(( SCORE + 10 ))
	else
		echo -e "\033[31m[FAIL]\033[0m\t\t \033[1m/dev/sdb1\033[0m is NOT mounted with the xfs filesystem on \033[1m/data\033[0m"
	fi
	TOTAL=$(( TOTAL + 10 ))
fi

# finding sdb1 UUID 
if [ $PART = 'sdb1' ]
then
	SDB1UUID=$(blkid | awk '/sdb1/ { print $2 }' | sed 's/UUID="//' | sed 's/"//')
	echo SDB1UUID is set to $SDB1UUID
fi

if lsblk | grep disk  | sed -n '2p' | awk '{ print $1 }' | grep nvme0n2 &>/dev/null
then
        PART=nvme0n2p1
        if mount | grep $PART | grep -i xfs &>/dev/null
        then
                echo -e "\033[32m[OK]\033[0m\t\t \033[1m$PART\033[0m is mounted with the xfs filesystem on \033[1m/data\033[0m"
                SCORE=$(( SCORE + 10 ))
        else
                echo -e "\033[31m[FAIL]\033[0m\t\t \033[1m$PART\033[0m is NOT mounted with the xfs filesystem on \033[1m/data\033[0m"
        fi
        TOTAL=$(( TOTAL + 10 ))
fi

# finding sdb1 UUID
if [ $PART = 'nvme0n2p1' ]
then
        SDB1UUID=$(blkid | awk '/nvme0n2p1/ { print $2 }' | sed 's/UUID="//' | sed 's/"//')
	echo SDB1UUID is set to $SDB1UUID
fi

if [ -z $PART ]
then
	return
fi

#### we need to get out if there is no partition
if grep ${SDB1UUID} /etc/fstab &>/dev/null
then
	echo -e "\033[32m[OK]\033[0m\t\t \033[1m/dev/sdb1\033[0m is mounted persistently by its UUID"
	SCORE=$(( SCORE + 10 ))
else
	echo -e "\033[31m[FAIL]\033[0m\t\t \033[1m/dev/sdb1\033[0m is not mounted persistently by its UUID"
fi
TOTAL=$(( TOTAL + 10 ))

if mount | grep lvlabs | grep -i ext4 &>/dev/null
then
	echo -e "\033[32m[OK]\033[0m\t\t the logical volume \033[1m/dev/vglabs/lvlabs\033[0m is mounted as ext4 filesystem"
	SCORE=$(( SCORE + 10 ))
else
	echo -e "\033[31m[FAIL]\033[0m\t\t the logical volume \033[1m/dev/vglabs/lvlabs\033[0m is not mounted as an ext4 filesystem"
fi
TOTAL=$(( TOTAL + 10 ))

if grep lvlabs /etc/fstab &>/dev/null
then
	echo -e "\033[32m[OK]\033[0m\t\t \033[1m/dev/vglabs/lvlabs\033[0m is mounted persistently"
	SCORE=$(( SCORE + 10 ))
else
	echo -e "\033[31m[FAIL]\033[0m\t\t no entry found for \033[1m/dev/vglabs/lvlabs\033[0m in /etc/fstab"
fi
TOTAL=$(( TOTAL + 10 ))

if systemctl is-active tmp.mount &>/dev/null
then
	echo -e "\033[32m[OK]\033[0m\t\t systemd \033[1mtmp.mount\033[0m unit is active"
	SCORE=$(( SCORE + 10 ))
else
	echo -e "\033[31m[FAIL]\033[0m\t\t systemd \033[1mtmp.mount\033[0m unit is not active"
fi
TOTAL=$(( TOTAL + 10 ))
