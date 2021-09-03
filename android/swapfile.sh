#!/usr/bin/env bash
# A script to mount my local /swapfile before executing Android builds

Pre=$(sudo /sbin/swapon --show)

if [[ -z ${Pre} ]]; then
    sudo /sbin/swapon /swapfile
    echo -e "\n${Whi}Swapfile is now active and using: \n${Byel}${Pre}${Res}\n"
    sleep 3
    echo -e "${Red}Don't forget to unmount swap when finished by running the ${Bwhi}'swapoff'${Res}${Red} command.\n${Res}"
    exit
else
    echo -e "\n${Byel}Swapfile is already mounted!"
    sleep 2
    echo -e "\n${Bwhi}\nExiting...\n${Res}"
    exit 1
fi
