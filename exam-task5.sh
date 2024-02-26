if [ -b /dev/sdb ]
then
	echo -e "\033[32m[OK]\033[0m\t\t block device \033[1m/dev/sdb\033[0m was found"
else
	echo -e "\033[31m[FAIL]\033[0m\t\t block device \033[1m/dev/sdb\033[0m was not found"
fi


if [ -b /dev/sdb1 ] && [ -b /dev/sdb2 ]
then
	echo -e "\033[32m[OK]\033[0m\t\t partitions \033[1m/dev/sdb1\033[0m and \033[1m/dev/sdb2\033[0m were found"
	SCORE=$(( SCORE + 10 ))
else
	echo -e "\033[31m[FAIL]\033[0m\t\t partitions \033[1m/dev/sdb1\033[0m and \033[1m/dev/sdb2\033[0m were not found"
fi
TOTAL=$(( TOTAL + 10 ))


if fdisk -l /dev/sdb | grep gpt &>/dev/null
then
	echo -e "\033[32m[OK]\033[0m\t\t disk uses a GPT"
	SCORE=$(( SCORE + 10 ))
else
	echo -e "\033[31m[FAIL]\033[0m\t\t disk doesn't use a GPT"
	SCORE=$(( SCORE - 10 ))
fi
TOTAL=$(( TOTAL + 10 ))


if fdisk -l /dev/sdb | awk '/sdb1/ && /2G/' &>/dev/null
then
	echo -e "\033[32m[OK]\033[0m\t\t the first partition has a size of 2G"
	SCORE=$(( SCORE + 10 ))
else
	echo -e "\033[31m[FAIL]\033[0m\t\t incorrect size on first partition"
fi
TOTAL=$(( TOTAL + 10 ))


if [[ $(fdisk -l /dev/sdb | awk '/sdb2/ && /5G/ && /LVM/' &>/dev/null) ]]
then
	echo -e "\033[32m[OK]\033[0m\t\t the second partition has a size of 5G and is marked as LVM partition"
	SCORE=$(( SCORE + 10 ))
else
	if [[ $(fdisk -l /dev/sdb | awk '/sdb2/ && !/lvm/') ]]
	then
		echo -e "\033[31m[FAIL]\033[0m\t\t type of the second partition is incorrect"
	fi
	if [[ $(fdisk -l /dev/sdb | awk '/sdb2/ && !/5G/') ]]
        then
                echo -e "\033[31m[FAIL]\033[0m\t\t size of the second partition is not correct"
        fi
fi
TOTAL=$(( TOTAL + 10 ))


if true
then
	echo -e "\033[32m[OK]\033[0m\t\t "
	SCORE=$(( SCORE + 10 ))
else
	echo -e "\033[31m[FAIL]\033[0m\t\t "
fi
TOTAL=$(( TOTAL + 10 ))
