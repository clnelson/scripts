#!/usr/bin/env bash
LATEST_MAKE_VERSION="4.3"

cd /tmp || exit 13
axel -a -n 10 https://ftp.gnu.org/gnu/make/make-"${1:?}".tar.gz
tar xvzf /tmp/make-"${1:?}".tar.gz

cd /tmp/make-"${1:?}" || exit 13
./configure
bash ./build.sh
sudo install ./make /usr/local/bin/make

cd - || exit 13
rm -rf /tmp/make-"${1:?}"{,.tar.gz}

echo -e '\n\n'
make --version
