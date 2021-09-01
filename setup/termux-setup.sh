#!/data/data/com.termux/files/usr/bin/env bash

## Script for helping automate new Termux
## installations on Android devices

pkg upgrade -y

apt-get update && apt-get install \
	science-repo game-repo unstable-repo x11-repo -y

apt-get install aapt aria2 bat binutils curl exa fd \
	ffmpeg file geany geany-plugins git git-delta gzip \
	hexedit inxi lsof make man most nano neofetch nmap \
	openjdk-17 openssh progress pv python python2 rsync \
	tar texinfo unzip wget2 xz-utils zlib zstd -y

git clone https://github.com/Biggin/termux_bash -b mobile ~/

if [ -d ~/termux_bash/bash ]; then
	cd ~/termux_bash/bash || exit 13
	cp ../.infokey ~/
	cp -r .config .local .termux banner nanorc \
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

termux-reload-settings
termux-setup-storage
