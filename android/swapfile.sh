#!/usr/bin/env bash
# A script to mount my local $Andy/swapfile before executing Android builds
Andy=$HOME/Android
Pre=$(sudo /sbin/swapon --show)

if [[ -z $Pre ]]; then
    sudo /sbin/swapon $Andy/swapfile
    echo -e "\n${Whi}Swapfile is now active and using: \n${Byel}${Pre}${Res}\n"
    sleep 1.5
    echo -e "${Red}Don't forget to unmount swap when finished by running the ${Bwhi}'swapoff'${Res}${Red} command.\n${Res}"
    exit
else
    echo -e "\n${Byel}Swapfile is already mounted!"
    echo -d $Pre
    sleep 1.5
    echo -e "\n${Bwhi}\nExiting...\n${Res}"
    exit 1
fi
