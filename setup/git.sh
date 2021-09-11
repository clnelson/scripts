#!/usr/bin/env bash

LATEST_TAG=$(curl https://api.github.com/repos/git/git/tags | jq -r '.[0].name')

git clone https://github.com/git/git -b "$LATEST_TAG"

cd git || exit 13

make configure

./configure --prefix=/usr/local/ --with-curl

make install -j"$(nproc)"

cd - || exit 13
rm -rf git

echo -ne ${Yel}"Which git identity would you like to use? "${Res}
if [ -z ${GIT_ID} ]; then
	read -r GIT_ID
	bash ~/scripts/git-id.sh ${GIT_ID}
else
	bash ~/scripts/git-id.sh ${GIT_ID}
fi
git --version
