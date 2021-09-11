#!/usr/bin/env bash
local setup="$HOME/scripts/setup"
local curr="$(pwd)"

## Ensure that my color codes are available
source $setup/colors.sh

# Updating and installing packages on a fresh install of Mint 32 bit
sudo add-apt-repository ppa:danielrichter2007/grub-customizer
sudo add-apt-repository ppa:webupd8team/atom

sudo apt update && sudo apt upgrade -y

sudo apt DPKG_FRONTEND=noninteractive install \
	aapt abootimg adb apksigner apktool append2simg apt-utils aria2 atom autoconf autogen automake \
	axel bc build-essential bzip2 ccache clang cmake curl fastboot flex g++ gawk gcc gcc-multilib \
	git g++-multilib gnupg gperf grub-customizer help2man htop hub imagemagick img2simg inxi jq \
	lsb-core lzip lzop make maven mkbootimg most ncftp neofetch ninja-build nmap openjdk-8-jdk p7zip-full \
	patch patchelf pidcat pkg-config pngcrush pngquant progress pv python2.7 re2c repo rsync simg2img skales \
	squashfs-tools texinfo unzip w3m wget xsltproc zip zipalign ziptool -y

local function sharkdp_dl () {
	echo -e "${Yel}Downloading and installing bat.${Res}"
	curl -L -O https://github.com/sharkdp/bat/releases/download/v0.18.3/bat_0.18.3_i686.deb
	sudo dpkg --add-architecture i686 && sudo dpkg -i bat_0.18.3_i686.deb
	sleep 0.5

	echo -e "${Yel}Downloading and installing fd.${Res}"
	curl -L -O https://github.com/sharkdp/fd/releases/download/v8.2.1/fd_8.2.1_i386.deb
	sudo dpkg -i fd_8.2.1_i386.deb

	rm -f *.deb && cd $HOME || return 1
}

if [ -w /tmp ]; then
	cd /tmp || return 2
	sharkdp_dl
else
	mkdir -pv $HOME/working && cd $HOME/working || return 3
	sharkdp_dl

if [ ${curr} == ${setup} ]; then
	"${#0//}" msfinstall
else
	cd ${setup} || return 4
	"${#0//}" msfinstall
fi

cd $HOME || return 5
git clone https://github.com/OhMyBash/oh-my-bash && git clone https://github.com/clnelson/dotfiles

rm -rf oh-my-bash/{lib,img,custom,CODE_OF_CONDUCT.md,CONTRIBUTING.md,LICENSE}
mv oh-my-bash .dotfiles && cd dotfiles/bash || return 6

cp -r dotfiles/handmade dotfiles/lib ~/.dotfiles/ && cp dotfiles/bashrc ~/.bashrc && cp dotfiles/base.theme.sh ~/.dotfiles/themes
sudo cp banner nanorc /etc && sudo echo -e "\nneofetch\ncat /etc/banner" >> /etc/profile
cp -r .local .config .git_completion.bash .git-prompt.sh .dircolors

bash $setup/git.sh
bash $setup/hub.sh
bash $setup/ccache.sh
