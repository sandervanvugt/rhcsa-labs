if [ -f /tmp/bigfiles.txt ]
then
	echo -e "\033[32m[OK]\033[0m\t\t file /tmp/bigfiles.txt was found"
	SCORE=$(( SCORE + 10 ))
else
	echo -e "\033[31m[FAIL]\033[0m\t\t file /tmp/bigfiles.txt was not found"
fi
TOTAL=$(( TOTAL + 10 ))

find / -type f -size +200M -exec ls -l {} \; >/tmp/newfiles.txt 2>/dev/null

if diff /tmp/bigfiles.txt /tmp/newfiles.txt &>/dev/null
then
	echo -e "\033[32m[OK]\033[0m\t\t /tmp/bigfiles has a list of all files bigger than 200M"
	SCORE=$(( SCORE + 10 ))
else
	echo -e "\033[31m[FAIL]\033[0m\t\t /tmp/bigfiles doesn't seem to have a long listing of all files bigger than 200M"
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
