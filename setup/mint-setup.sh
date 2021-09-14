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
	axel bc bison build-essential bzip2 ccache clang cmake cowsay-off curl fastboot figlet file finger \
	flex fortunes-off g++ gawk gcc gcc-multilib git g++-multilib gnupg gperf grub-customizer help2man htop \
	hub imagemagick img2simg inxi jq libelf-dev libssl-dev lld lsb-core lzip lzop make man2html maven \
	mkbootimg most ncftp neofetch ninja-build nmap openjdk-8-jdk openssh-server openssh-sftp-server p7zip-full \
	patch patchelf pidcat pithos pkg-config pngcrush pngquant progress pv python2.7 python3 re2c repo rsync simg2img \
	skales squashfs-tools texinfo u-boot-tools unzip w3m wget xsltproc xz-utils zip zipalign ziptool zlib1g-dev -y

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
echo -e ${Bblu}"Cloning Oh-My-Bash to setup my environment!"${Res}
git clone https://github.com/OhMyBash/oh-my-bash.git
sleep 0.5
echo -e ${Byel}"Cloning my dotfiles for BASH configuration..."${Res}
git clone https://github.com/clnelson/dotfiles.git
sleep 0.5
echo -e ${Bcya}"Cloning tools to help in building Android from source!"${Res}
git clone https://github.com/Biggin/android_tools.git
sleep 0.5

rm -rf oh-my-bash/{lib,img,custom,CODE_OF_CONDUCT.md,CONTRIBUTING.md,LICENSE}
mv oh-my-bash .dotfiles && cd dotfiles/bash || return 6

cp -r dotfiles/handmade dotfiles/lib ~/.dotfiles/ && cp dotfiles/bashrc ~/.bashrc && cp dotfiles/base.theme.sh ~/.dotfiles/themes

sudo mkdir -pv /etc/banners
sudo cp login /etc/banners/ && sudo echo -e "\nneofetch\ncat /etc/banners/login" >> /etc/profile
sudo cp nanorc /etc/
cp -r .local .config .git_completion.bash .git-prompt.sh .dircolors

## TODO add interactive selection of whether or not you want to install these programs now...
bash $setup/git.sh
sleep 1
bash $setup/hub.sh
sleep 1
bash $setup/ccache.sh
