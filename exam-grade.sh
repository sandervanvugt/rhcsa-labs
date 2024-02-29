#!/bin/bash
# exit if not root
clear
ls /root &>/dev/null || (echo run this script with root privileges && exit 2)

# check if the system has recently rebooted
# Get the total uptime in minutes
uptime_minutes=$(awk '{ print int($1/60) }' /proc/uptime)

if [ "$uptime_minutes" -gt 5 ]
then
	echo -e "\e[5m\033[35m\033[1mWARNING\e[0m\033[0m\033[0m\t\tsystem has been up for more than 5 minutes." 
	echo -e "\e[5m\033[35m\033[1mWARNING\e[0m\033[0m\033[0m\t\tyou are required to reboot your system before running this script"
	echo -e "do you want to reboot now? Answer \033[1myes\033[0m to reboot immediately and no to continue"
	read REBOOT
	[ $REBOOT = yes ] && reboot
else
 	echo -e "your system recently rebooted. Good, let's continue!"
fi

# evaluating tasks
echo -e "\033[1mchecking task 1 results\033[0m"
source exam-task1.sh
echo the score is $SCORE
TOTALSCORE=$SCORE
TOTALTOTAL=$TOTAL

echo -e "\033[1mchecking task 2 results\033[0m"
source exam-task2.sh
echo the score is $SCORE
TOTALSCORE=$(( TOTAL + SCORE ))
TOTALTOTAL=$TOTAL

echo -e "\033[1mchecking task 3 results\033[0m"
source exam-task3.sh
echo the score is $SCORE
TOTALSCORE=$(( TOTAL + SCORE ))
TOTALTOTAL=$TOTAL

echo -e "\033[1mchecking task 4 results\033[0m"
source exam-task4.sh
echo the score is $SCORE
TOTALSCORE=$(( TOTAL + SCORE ))
TOTALTOTAL=$TOTAL

echo -e "\033[1mchecking task 5 results\033[0m"
source exam-task5.sh
echo the score is $SCORE
TOTALSCORE=$(( TOTAL + SCORE ))
TOTALTOTAL=$TOTAL

echo -e "\033[1mchecking task 6 results\033[0m"
source exam-task6.sh
echo the score is $SCORE
TOTALSCORE=$(( TOTAL + SCORE ))
TOTALTOTAL=$TOTAL

echo -e "\033[1mchecking task 7 results\033[0m"
source exam-task7.sh
echo the score is $SCORE
TOTALSCORE=$(( TOTAL + SCORE ))
TOTALTOTAL=$TOTAL

echo -e "\033[1mchecking task 8 results\033[0m"
source exam-task8.sh
echo the score is $SCORE
TOTALSCORE=$(( TOTAL + SCORE ))
TOTALTOTAL=$TOTAL

echo -e "\033[1mchecking task 9 results\033[0m"
source exam-task9.sh
echo the score is $SCORE
TOTALSCORE=$(( TOTAL + SCORE ))
TOTALTOTAL=$TOTAL

echo -e "\033[1mchecking task 10 results\033[0m"
source exam-task10.sh
echo the score is $SCORE
TOTALSCORE=$(( TOTAL + SCORE ))
TOTALTOTAL=$TOTAL

echo -e "\033[1mchecking task 11 results\033[0m"
source exam-task11.sh
echo the score is $SCORE
TOTALSCORE=$(( TOTAL + SCORE ))
TOTALTOTAL=$TOTAL

echo -e "\033[1mchecking task 12 results\033[0m"
source exam-task12.sh
echo the score is $SCORE
TOTALSCORE=$(( TOTAL + SCORE ))
TOTALTOTAL=$TOTAL

echo -e "\033[1mchecking task 13 results\033[0m"
source exam-task13.sh
echo the score is $SCORE
TOTALSCORE=$(( TOTAL + SCORE ))
TOTALTOTAL=$TOTAL

echo -e "\033[1mchecking task 14 results\033[0m"
source exam-task14.sh
echo the score is $SCORE
TOTALSCORE=$(( TOTAL + SCORE ))
TOTALTOTAL=$TOTAL


#### print PASS/FAIL
echo -e "\n"
echo your score is $SCORE out of a total of $TOTAL

if [[ $SCORE -ge $(( TOTAL / 10 * 7 )) ]]
then
        echo -e "\033[32mCONGRATULATIONS!!\033[0m\t\t You passed this sample exam!"
	echo -e "\033[1mResults obtained here don't guarantee anything for the real exam\033[0m"
else
        echo -e "\033[31m[FAIL]\033[0m\t\t You did NOT pass this sample exam \033[36m:-(\033[0m"
fi

