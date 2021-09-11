#!/usr/bin/env bash

cd /tmp || exit 13
git clone git://github.com/ccache/ccache.git

cd ccache || exit 13
./autogen.sh
./configure --with-libzstd-from-internet --with-libb2-from-internet
make -j"$(nproc)"
sudo make install

rm -rf "${PWD}"
cd ~/.local/bin || exit 13

if [ $(command -v ccache) ]; then
	local CC=$(which ccache)
	ln -s ${CC} gcc
	ln -s ${CC} g++
	ln -s ${CC} cc
	ln -s ${CC} c++
fi

cd $HOME || exit 13
ccache --version
