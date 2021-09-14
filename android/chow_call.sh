#!/usr/bin/env bash

#: Author: clnelson@github.com
#: Date: 10/25/2020
#: License: GPLv3

# A script to unset some things in my environment and add some paths and additional functions as well for building Android (AOSP)
Scripts=$HOME/scripts/android
source ${Scripts}/swapfile.sh

export
PATH=~/.local/bin:$HOME/scripts/android:/usr/lib/ccache:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games
export USE_CCACHE=1
export ALLOW_MISSING_DEPENDENCIES=true
export CCACHE_EXEC=$(command -v ccache)
export GIT_PS1_SHOWUPSTREAM=author
export GIT_PS1_SHOWCOLORHINTS=1
export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWSTASHSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=1
export LC_ALL=C
#export LANG=""

unset PS1
export
PS1='\[\033[01;32m\]\342\224\214\342\224\200[\[\033[33m\]\u\[\033[00m\]\[\033[31m\]@\[\033[01;34m\]\h\[\033[01;32m\]]\342\224\200[\[\033[00m\]\[\033[37m\]\w\[\033[01;32m\]]\n\342\224\224\342\224\200\342\224\200\342\225\274$(__git_ps1 "${Bwhi}(${Bblk}%s${Bwhi})${Red}->") \[\033[00m\]$'

echo -e "${Whi}Setting cpu to performance mode for every possible gain we can get..."
setperf
sleep 2

Cpu=$(cat /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor)
Mode=$(echo -e ${Cpu} | cut -d ' ' -f 1)
echo -e "All processors are currently set to: ${Bmag}${Mode}${Res}\n"

source $(pwd)/build/envsetup.sh
echo -e "\n${Yel}Enjoy your stay and have ${Bblu}FUN${Whi}!!!${Res}\n"
