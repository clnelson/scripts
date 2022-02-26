#!/data/data/com.termux/files/usr/bin/env bash

## Script for helping automate new Termux
## installations on Android devices
pkg upgrade -y

apt-get update && apt-get install \
	science-repo game-repo unstable-repo x11-repo git -y

apt-get install aapt aria2 bat binutils curl exa fd \
	ffmpeg file geany geany-plugins gzip hexedit inxi lsof \
	make man most nano neofetch nmap openjdk-17 openssh \
	progress pv python python2 rsync tar texinfo unzip \
	wget xz-utils zlib zstd -y

git clone https://github.com/Biggin/Termux_Bash -b \
  mobile ~/termux_bash

if [ -d ~/termux_bash/bash ]; then
	cd ~/termux_bash/bash || return 13
	cp ../.infokey ~/
	cp -r .config .termux banner nanorc \
		.dircolors .git* ~/
	cd ~/ && mv banner nanorc $PREFIX/etc/
	echo -ne '\nneofetch\ncat $PREFIX/etc/banner' >> $PREFIX/etc/profile
	mv $PREFIX/etc/motd $PREFIX/etc/motd.bak

	git clone https://github.com/ohmybash/oh-my-bash ~/.dotfiles
	if [ -d ~/.dotfiles ]; then
		cp -r ~/termux_bash/bash/dotfiles/handmade ~/.dotfiles/
		cp ~/termux_bash/bash/dotfiles/bashrc \
		~/.bashrc && source ~/.bashrc
		rm -rf ~/.dotfiles/custom
	fi
fi
