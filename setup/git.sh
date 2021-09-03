#!/usr/bin/env bash

sudo apt update
sudo apt install jq curl git -y

LATEST_TAG=$(curl https://api.github.com/repos/git/git/tags | jq -r '.[0].name')

git clone https://github.com/git/git -b "$LATEST_TAG"

cd git || exit 1

make configure

./configure --prefix=/usr/local/ --with-curl

make install -j"$(nproc)"

git --version

cd - || exit 1

rm -rf git

echo -ne ${Yel}"Which git identity would you like to use? "${Res}
read -r GIT_ID

bash ~/scripts/git-id.sh ${GIT_ID}
