#!/usr/bin/env bash

# Script to add a new Name to a Linux System
export Name="${1}"

if [ -z "${Name}" ]; then
    echo -e ${Cya}"Please enter a Name"${Res}
    read -r Name
fi
sleep 1

sudo useradd "${Name}" -m -s /bin/bash
passwd "${Name}"
chage -d 0 "${Name}"
sleep 1

echo -e ${Red}"You'll be required to change your password on your next login"${Res}
