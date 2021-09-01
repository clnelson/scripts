# #!/usr/bin/env bash
# sudo apt install fping

#End_IP=$1
#Phone_IP=192.168.1.$End_IP
Phone_IP=192.168.1.

Port=5555

sudo adb kill-server

itest=$(fping $Phone_IP | grep alive)
while [ \"$itest\" == \"\" ]
do
        echo -en "\033[33m\n\t\tDevice not online yet...\033[36m\n\n\n\t\t...Trying again in 3 seconds..\033[00m"
        sleep 3
        itest=$(fping $Phone_IP | grep alive)
done
echo -en "\033[1;32$Phone_IP is now online\033[00m"

sudo adb connect $Phone_IP
sleep 5

adb -s "$Phone_IP:$Port" shell
