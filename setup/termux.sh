#!/data/data/com.termux/files/usr/bin/env bash

## Script for helping automate new Termux
## installations on Android devices
pkg upgrade -y

apt update && apt \
	DEBIAN_FRONTEND=noninteractive install \
	science-repo game-repo unstable-repo \
	x11-repo -y
sleep 1

apt install fd file inxi neofetch curl wget git \
	aapt ffmpeg gzip bat nmap make man megatools \
	most nano openssh python python2 rsync texinfo \
	unzip xz-utils zlib tar zstd shtool bzip2 pv \
	lsof openjdk-17 p7zip manpages mediainfo -y

git clone https://github.com/clnelson/termux_bash -b mobile ~/

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

if [ -z ~/scripts ]; then
	git clone https://github.com/clnelson/scripts -b mobile ~/scripts
	cd ~/scripts || exit 13
	bash setup/termux.sh
else
	cd ~/scripts || exit 13
	bash setup/termux.sh
fi

bat cache --build
sleep 0.5

termux-reload-settings
termux-setup-storage

source ~/scripts/setup/git-id.sh
