if [ -x /usr/local/bin/countdown.sh ] &>/dev/null
then
	echo -e "\033[32m[OK]\033[0m\t\t executable file /usr/local/bin/countdown.sh was found"
	SCORE=$(( SCORE + 10 ))
else
	echo -e "\033[31m[FAIL]\033[0m\t\t countdown.sh was not found in /usr/local/bin"
fi
TOTAL=$(( TOTAL + 10 ))

if grep '$1' /usr/local/bin/countdown.sh &>/dev/null
then
	echo -e "\033[32m[OK]\033[0m\t\t script will evaluate a command line argument"
	SCORE=$(( SCORE + 10 ))
else
	echo -e "\033[31m[FAIL]\033[0m\t\t the script doesn't evaluate a command line argument"
fi
TOTAL=$(( TOTAL + 10 ))

if grep -- '-z $1' /usr/local/bin/countdown.sh &>/dev/null
then
	echo -e "\033[32m[OK]\033[0m\t\t script handles situation where \$1 was not provided"
	SCORE=$(( SCORE + 10 ))
else
	echo -e "\033[31m[FAIL]\033[0m\t\t script doesn't handle situation where \$1 was not provided"
fi
TOTAL=$(( TOTAL + 10 ))

if grep 'seconds remaining' /usr/local/bin/countdown.sh &>/dev/null
then
	echo -e "\033[32m[OK]\033[0m\t\t script prints how many seconds remaining"
	SCORE=$(( SCORE + 10 ))
else
	echo -e "\033[31m[FAIL]\033[0m\t\t script doesn't print how many seconds remaining"
fi
TOTAL=$(( TOTAL + 10 ))

if grep '$COUNTER.*0' /usr/local/bin/countdown.sh &>/dev/null
then
	echo -e "\033[32m[OK]\033[0m\t\t conditional check for 0 seconds remaining was found"
	SCORE=$(( SCORE + 10 ))
else
	echo -e "\033[31m[FAIL]\033[0m\t\t no conditional check for 0 seconds remaining was found"
fi
TOTAL=$(( TOTAL + 10 ))

if grep 'while' /usr/local/bin/countdown.sh &>/dev/null
then
	echo -e "\033[32m[OK]\033[0m\t\t a \033[1mwhile\033[0m statement was found"
	SCORE=$(( SCORE + 10 ))
else
	echo -e "\033[31m[FAIL]\033[0m\t\t script doesn't seem to be functional as no \033[1mwhile\033[0m statement was found"
fi
TOTAL=$(( TOTAL + 10 ))
