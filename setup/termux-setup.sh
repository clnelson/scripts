#!/data/data/com.termux/files/usr/bin/env bash

## Script for helping automate new Termux
## installations on Android devices
pkg upgrade -y && pkg install git

apt update && apt-get \
	DEBIAN_FRONTEND=noninteractive install \
	science-repo game-repo unstable-repo \
	x11-repo fd file inxi neofetch curl wget \
	aapt ffmpeg gzip bat nmap make man nano \
	openssh python python2 rsync texinfo unzip \
	xz-utils zlib img2sdat sdat2img mkbootimg \
	ext4fs-tools tar zstd shtool aapt bzip2 \
	geany geany-plugins lolcat lsof vdexextractor
	 -y

git clone https://github.com/Biggin/Termux_Bash -b mobile ~/termux_bash

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
