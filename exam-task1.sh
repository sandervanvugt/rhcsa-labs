if file /rhel9.iso | grep 9660 &>/dev/null
then
	echo -e "\033[32m[OK]\033[0m\t\t /rhel9.iso file was found"
	SCORE=$(( SCORE + 10 ))
else
	echo -e "\033[31m[FAIL]\033[0m\t\t /rhel9.iso file was not found"
fi
TOTAL=$(( TOTAL + 10 ))

if mount | grep /repo | grep rhel9 &>/dev/null
then
        echo -e "\033[32m[OK]\033[0m\t\t the rhel9.iso file is mounted on /repo"
        SCORE=$(( SCORE + 10 ))
else
        echo -e "\033[31m[FAIL]\033[0m\t\t the rhel9.iso file is not mounted on /repo"
fi
TOTAL=$(( TOTAL + 10 ))

if grep -l http /etc/yum.repos.d/* | grep -v redhat.repo &>/dev/null
then
        echo -e "\033[31m[FAIL]\033[0m\t\t your system is using external registries. this is not allowed. removing 50 points from your score"
	SCORE=$(( SCORE - 50 ))
fi

if [[ $(grep "baseurl=file:///" /etc/yum.repos.d/* | wc -l ) == 2 ]]
then
        echo -e "\033[32m[OK]\033[0m\t\t found the 2 repositories from the ISO file"
        SCORE=$(( SCORE + 10 ))
else
        echo -e "\033[31m[FAIL]\033[0m\t\t repositories from teh ISO file not found"
fi
TOTAL=$(( TOTAL + 10 ))

