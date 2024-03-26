#!/bin/bash
# 
# created by Sander van Vugt, mail@sandervanvugt.nl
# please send suggestions for improvement to the above email address

clear
ls /root &>/dev/null || (echo run this script with root privileges && exit 2)

#### TASK 1
echo -e "\033[1mchecking lab 13.2 results\033[0m"
#sudo -u linda -i <<HERE

if true
then
        echo -e "\033[32m[OK]\033[0m\t\t good! I can find the container mariadb. Let's check all required conditions"
        if true
        then
                echo -e "\033[32m[OK]\033[0m\t\t database has been created"
        else
                echo -e "\033[31m[FAIL]\033[0m\t\t the database has not been created"
        fi

        if true
        then
        echo -e "\033[32m[OK]\033[0m\t\t found the database files"
        else
                echo -e "\033[31m[FAIL]\033[0m\t\t i cannot find the database files"
        fi

        if true
        then
        echo -e "\033[32m[OK]\033[0m\t\t container exposed on host port 3206"
        else
                echo -e "\033[31m[FAIL]\033[0m\t\t the container isn't listening on host port 3206"
        fi

else
        echo -e "\033[31m[FAIL]\033[0m\t\t the container mydb was not found"
fi

####closing the user linda shell
#HERE

