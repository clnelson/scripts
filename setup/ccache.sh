#!/usr/bin/env bash

#cd /tmp || exit 13
git clone https://github.com/ccache/ccache.git

cd ccache || exit 13
cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr/local \
	-DHIREDIS_FROM_INTERNET=ON -DZSTD_FROM_INTERNET=ON
#./configure --with-libzstd-from-internet --with-libb2-from-internet
make -j"$(nproc)"
sudo make install

rm -rf "${PWD}"

if [ $(command -v ccache) ]; then
	CC=$(which ccache)
	cd ~/.local/bin || exit 13
	ln -s ${CC} gcc
	ln -s ${CC} g++
	ln -s ${CC} cc
	ln -s ${CC} c++
fi

cd $HOME || exit 13
ccache --version
