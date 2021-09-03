#!/usr/bin/env bash

#: Author: clnelson@github.com
#: Date: Nov-2020
#: A script to setup an Android build environment on a new Ubuntu machine

## Ensure that my color codes are available
source ~/scripts/setup/colors.sh

## Install lsb-core packages
sudo apt update
sudo apt install lsb-core -y

LATEST_MAKE_VERSION="4.3"
LSB_RELEASE="$(lsb_release -d | cut -d ':' -f 2 | sed -e 's/^[[:space:]]*//')"

echo -e ${Grn}"Updating sources & installing the necessary packages to build Android!"${Res}

sudo DEBIAN_FRONTEND=noninteractive apt install \
	aapt abootimg adb android-framework-res \
	android-sdk* apksigner apktool append2simg \
	apt-utils autoconf automake autogen axel \
	bcbison build-essential clang cmake curl \
	jq dalvik-exchange dexdump dexlist expat \
	fastboot flex g++ g++-multilib gawk gcc \
	gcc-multilib git gnupg gperf help2man htop \
	img2simg imagemagick libexpat1-dev inxi \
	libgmp-dev '^liblz4-.*' '^liblzma.*' rsync \
    libmpc-dev libmpfr-dev libsmali-java re2c \
    libsmali-1-java lib32ncurses5-dev lib32z-dev \
    lib32z1-dev libtinfo5 libc6-dev libcap-dev \
    libc6-dev-i386 x11proto-core-dev libx11-dev \
    libxml-simple-perl libgl1-mesa-dev maven \
    libxml2-utils xsltproc ncftp pidcat zipalign \
    ncurses-dev openjdk-8-jdk patch patchelf \
    pkg-config pngcrush pngquant python2.7 w3m \
    python-all-dev schedtool simg2img skales \
    squashfs-tools subversion texinfo unzip zip \
    xsltproc zlib1g-dev lzip libncurses5-dev \
    libsdl1.2-dev libssl-dev libtool libxml2 \
    libxml2-utils '^lzma.*' lzop p7zip-full -y

## Download and install repo from Google
echo -e ${Bwhi}"Installing Google's repo tool..."${Res}
 if [ -d ~/.local/bin ]; then
     sudo curl -L -o ~/.local/bin/repo -O -L https://storage.googleapis.com/git-repo-downloads/repo
 else
     sudo curl --create-dirs -L -o ~/.local/bin/repo -O -L https://storage.googleapis.com/git-repo-downloads/repo
 fi
sudo chmod a+rx ~/.local/bin/repo

## Link ncurses library thats not available in Ubuntu 20.04, if that is the version we're using

# shellcheck disable=SC2076
 if [[ ${LSB_RELEASE} =~ "Ubuntu Focal Fossa" ]]; then
 	if [[ -e /lib/x86_64-linux-gnu/libncurses.so.6 && ! -e /usr/lib/x86_64-linux-gnu/libncurses.so.5 ]]; then
 	sudo ln -s \
 		 /lib/x86_64-linux-gnu/libncurses.so.6 \
 		 /usr/lib/x86_64-linux-gnu/libncurses.so.5
 	fi
 fi

## Upgrade make to the latest version from they're website, not Ubuntu repos
 if [[ "$(command -v make)" ]]; then
     echo -e ${Yel} "Checking make installation and version..."${Res}
     makeversion="$(make -v | head -1 | awk '{print $3}')"
     if [[ ${makeversion} != "${LATEST_MAKE_VERSION}" ]]; then
         echo -e ${Blu}"Installing make ${LATEST_MAKE_VERSION} instead of ${makeversion}"${Res}
         bash "$(dirname "$0")"/make.sh "${LATEST_MAKE_VERSION}"
     fi
 fi

## Setup udev rules for Android devices
 if [[ "$(command -v adb)" != "" ]]; then
 	echo -e ${Mag}"Setting up udev rules for adb!"${Res}
	sudo curl --create-dirs -L -o /etc/udev/rules.d/51-android.rules -O -L https://raw.githubusercontent.com/M0Rf30/android-udev-rules/master/51-android.rules
	sudo chmod 644 \
		/etc/udev/rules.d/51-android.rules
	sudo chown root \
		/etc/udev/rules.d/51-android.rules
	sudo systemctl restart udev
	adb kill-server
	sudo killall adb
 fi

## Source and install various tools from their own website not Ubuntu repos
source ~/scripts/setup/git.sh
source ~/scripts/setup/hub.sh
source ~/scripts/setup/ccache.sh
