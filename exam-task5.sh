if [ -b /dev/?db ]
then
	echo -e "\033[32m[OK]\033[0m\t\t block device \033[1m/dev/?db\033[0m was found"
	if [ -b /dev/?db1 ] && [ -b /dev/?db2 ]
	then
		echo -e "\033[32m[OK]\033[0m\t\t partitions \033[1m/dev/?db1\033[0m and \033[1m/dev/?db2\033[0m were found"
		SCORE=$(( SCORE + 10 ))
	else
		echo -e "\033[31m[FAIL]\033[0m\t\t partitions \033[1m/dev/?db1\033[0m and \033[1m/dev/?db2\033[0m were not found"
	fi
	TOTAL=$(( TOTAL + 10 ))


	if fdisk -l /dev/?db | grep gpt &>/dev/null
	then
		echo -e "\033[32m[OK]\033[0m\t\t disk uses a GPT"
		SCORE=$(( SCORE + 10 ))
	else
		echo -e "\033[31m[FAIL]\033[0m\t\t disk doesn't use a GPT"
		SCORE=$(( SCORE - 10 ))
	fi
	TOTAL=$(( TOTAL + 10 ))

	if fdisk -l /dev/?db | awk '/?db1/ && /2G/' &>/dev/null
	then
		echo -e "\033[32m[OK]\033[0m\t\t the first partition has a size of 2G"
		SCORE=$(( SCORE + 10 ))
	else
		echo -e "\033[31m[FAIL]\033[0m\t\t incorrect size on first partition"
	fi
	TOTAL=$(( TOTAL + 10 ))

	if [[ $(fdisk -l /dev/?db | awk '/?db2/ && /5G/ && /LVM/' &>/dev/null) ]]
	then
		echo -e "\033[32m[OK]\033[0m\t\t the second partition has a size of 5G and is marked as LVM partition"
		SCORE=$(( SCORE + 10 ))
	else
		if [[ $(fdisk -l /dev/?db | awk '/?db2/ && !/LVM/') ]]
		then
			echo -e "\033[31m[FAIL]\033[0m\t\t type of the second partition is incorrect"
		fi
		if [[ $(fdisk -l /dev/?db | awk '/?db2/ && !/5G/') ]]
       		then
               		echo -e "\033[31m[FAIL]\033[0m\t\t size of the second partition is not correct"
        	fi
	fi
	TOTAL=$(( TOTAL + 10 ))
fi

if [ -b /dev/nvme0n2 ]
then
        echo -e "\033[32m[OK]\033[0m\t\t block device \033[1m/dev/nvme0n2\033[0m was found"
        if [ -b /dev/nvme0n2p1 ] && [ -b /dev/nvme0n2p2 ]
        then
                echo -e "\033[32m[OK]\033[0m\t\t partitions \033[1m/dev/nvme0n2p1\033[0m and \033[1m/dev/nvme0n2p2\033[0m were found"
                SCORE=$(( SCORE + 10 ))
        else
                echo -e "\033[31m[FAIL]\033[0m\t\t partitions \033[1m/dev/nvme0n2p1\033[0m and \033[1m/dev/nvme0n2p2\033[0m were not found"
        fi
        TOTAL=$(( TOTAL + 10 ))


        if fdisk -l /dev/nvme0n2 | grep gpt &>/dev/null
        then
                echo -e "\033[32m[OK]\033[0m\t\t disk uses a GPT"
                SCORE=$(( SCORE + 10 ))
        else
                echo -e "\033[31m[FAIL]\033[0m\t\t disk doesn't use a GPT"
                SCORE=$(( SCORE - 10 ))
        fi
        TOTAL=$(( TOTAL + 10 ))

        if fdisk -l /dev/nvme0n2 | awk '/nvme0n2p1/ && /2G/' &>/dev/null
        then
                echo -e "\033[32m[OK]\033[0m\t\t the first partition has a size of 2G"
                SCORE=$(( SCORE + 10 ))
        else
                echo -e "\033[31m[FAIL]\033[0m\t\t incorrect size on first partition"
        fi
        TOTAL=$(( TOTAL + 10 ))

        if [[ $(fdisk -l /dev/nvme0n2 | awk '/nvme0n2p2/ && /5G/ && /LVM/' &>/dev/null) ]]
        then
                echo -e "\033[32m[OK]\033[0m\t\t the second partition has a size of 5G and is marked as LVM partition"
                SCORE=$(( SCORE + 10 ))
        else
                if [[ $(fdisk -l /dev/nvme0n2 | awk '/nvme0n2p2/ && !/LVM/') ]]
                then
                        echo -e "\033[31m[FAIL]\033[0m\t\t type of the second partition is incorrect"
                fi
                if [[ $(fdisk -l /dev/nvme0n2 | awk '/nvme0n2p2/ && !/5G/') ]]
                then
                        echo -e "\033[31m[FAIL]\033[0m\t\t size of the second partition is not correct"
                fi
        fi
        TOTAL=$(( TOTAL + 10 ))
fi

