if [[ $(lsblk | grep disk | wc -l) == 2 ]]
then
	echo -e "\033[32m[OK]\033[0m\t\t a second disk was found!"
else
        echo -e "\033[31m[FAIL]\033[0m\t\t a second disk was not found"
	echo please add a second disk and try again.
	exit 3
fi

if [ -b /dev/?db ]
then
	echo -e "\033[32m[OK]\033[0m\t\t block device \033[1m/dev/?db\033[0m was found"
	if [ -b /dev/?db1 ]
	then
		echo -e "\033[32m[OK]\033[0m\t\t partition \033[1m/dev/?db1\033[0m was found"
	else
		echo -e "\033[31m[FAIL]\033[0m\t\t partition \033[1m/dev/?db1\033[0m was not found"
	fi


	if fdisk -l /dev/?db | grep gpt &>/dev/null
	then
		echo -e "\033[32m[OK]\033[0m\t\t disk uses a GPT"
	else
		echo -e "\033[31m[FAIL]\033[0m\t\t disk doesn't use a GPT"
	fi

	if fdisk -l /dev/?db | awk '/?db1/ && /2G/' &>/dev/null
	then
		echo -e "\033[32m[OK]\033[0m\t\t the partition has a size of 2G"
	else
		echo -e "\033[31m[FAIL]\033[0m\t\t incorrect size on partition"
	fi
	exit
fi

if [ -b /dev/nvme0n2 ]
then
        echo -e "\033[32m[OK]\033[0m\t\t block device \033[1m/dev/nvme0n2\033[0m was found"
        if [ -b /dev/nvme0n2p1 ] 
        then
                echo -e "\033[32m[OK]\033[0m\t\t partition \033[1m/dev/nvme0n2p1\033[0m was found"
        else
                echo -e "\033[31m[FAIL]\033[0m\t\t partition \033[1m/dev/nvme0n2p1\033[0m was not found"
        fi


        if fdisk -l /dev/nvme0n2 | grep gpt &>/dev/null
        then
                echo -e "\033[32m[OK]\033[0m\t\t disk uses a GPT"
        else
                echo -e "\033[31m[FAIL]\033[0m\t\t disk doesn't use a GPT"
        fi

        if fdisk -l /dev/nvme0n2 | awk '/nvme0n2p1/ && /2G/' &>/dev/null
        then
                echo -e "\033[32m[OK]\033[0m\t\t the partition has a size of 2G"
        else
                echo -e "\033[31m[FAIL]\033[0m\t\t incorrect size on first partition"
        fi
	exit
fi

echo -e "\033[36m[WEIRD...]\033[0m\t you do have a second disk, but it doesn't meet my expectations."
echo -e "\t\t\t please make sure the second disk is using the same type as the first disk."
