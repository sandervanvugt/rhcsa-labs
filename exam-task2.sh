if [ -f /root/bigfiles.txt ]
then
	echo -e "\033[32m[OK]\033[0m\t\t file /root/bigfiles.txt was found"
	SCORE=$(( SCORE + 10 ))
else
	echo -e "\033[31m[FAIL]\033[0m\t\t file /root/bigfiles.txt was not found"
fi
TOTAL=$(( TOTAL + 10 ))

find / -type f -size +200M -exec ls -l {} \; >/root/newfiles.txt 2>/dev/null

# making files with file names only to be able to use diff
awk '{ print $NF }' /root/bigfiles.txt > /root/bigfilenames.txt
awk '{ print $NF }' /root/newfiles.txt > /root/newfilenames.txt

# checking if command output is correct
if diff /root/bigfilenames.txt /root/newfilenames.txt &>/dev/null
then
	echo -e "\033[32m[OK]\033[0m\t\t /root/bigfiles.txt has a list of all files bigger than 200M"
	SCORE=$(( SCORE + 10 ))
else
	echo -e "\033[31m[FAIL]\033[0m\t\t /root/bigfiles.txt doesn't seem to have a long listing of all files bigger than 200M that matches your current system state"
fi
TOTAL=$(( TOTAL + 10 ))
