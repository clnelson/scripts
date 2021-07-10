#!/usr/bin/env bash
# A script to mount my local /swapfile before executing Android builds

Pre=$(sudo /sbin/swapon --show)

if [[ -z $Pre ]]; then
    sudo /sbin/swapon /swapfile
    echo -e "\n${whi}Swapfile is now active and using: \n${byel}$Pre${res}\n"
    echo -e "${red}Don't forget to unmount swap when finished by running the ${bwhi}'swapoff'${red} command.\n${RES}"
    return 0

else
    echo -e "\n${byel}Swapfile is already mounted!${bwhi}\nExiting...\n${res}"
    return 1

fi
