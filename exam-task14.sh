
####checking the systemd parts
if [ -f /home/student/.config/systemd/user/*.service ] &>/dev/null
then
        echo -e "\033[32m[OK]\033[0m\t\t systemd user unit was found"
        SCORE=$(( SCORE + 10 ))
else
        echo -e "\033[31m[FAIL]\033[0m\t\t systemd user unit was not found."
fi
TOTAL=$(( TOTAL + 10 ))

####checking if the systemd unit is enabled
if ps aux | grep conmon | grep student | grep mydb &>/dev/null
then
        echo -e "\033[32m[OK]\033[0m\t\t the container is currently running as a systemd unit"
        SCORE=$(( SCORE + 10 ))
else
        echo -e "\033[31m[FAIL]\033[0m\t\t the container is not currently running as a systemd unit"
fi
TOTAL=$(( TOTAL + 10 ))

