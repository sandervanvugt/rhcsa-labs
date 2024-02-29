if [ -f /root/bigfiles.txt ]
then
	echo -e "\033[32m[OK]\033[0m\t\t file /root/bigfiles.txt was found"
	SCORE=$(( SCORE + 10 ))
else
	echo -e "\033[31m[FAIL]\033[0m\t\t file /root/bigfiles.txt was not found"
fi
TOTAL=$(( TOTAL + 10 ))

find / -type f -size +200M -exec ls -l {} \; >/root/newfiles.txt 2>/dev/null

if diff /root/bigfiles.txt /root/newfiles.txt &>/dev/null
then
	echo -e "\033[32m[OK]\033[0m\t\t /root/bigfiles has a list of all files bigger than 200M"
	SCORE=$(( SCORE + 10 ))
else
	echo -e "\033[31m[FAIL]\033[0m\t\t /root/bigfiles doesn't seem to have a long listing of all files bigger than 200M"
fi
TOTAL=$(( TOTAL + 10 ))
