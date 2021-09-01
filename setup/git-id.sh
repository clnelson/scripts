#!/usr/bin/env bash

## Script for handling multiple git identities
 if [[ ${1} == "clnelson" ]]; then
	 git config --global user.name "clnelson"
	 git config --global user.email \
		"dumb.droid.dev@outlook.com"
 elif [[ ${1} == "Biggin" ]]; then
 	 git config --global user.name "Biggin"
 	 git config --global user.email \
		"biggin61186@gmail.com"
 else
 	GIT_USERNAME="$(git config --get user.name)"
 	GIT_EMAIL="$(git config --get user.email)"

	echo -ne $Bwhi"Configuring git!\n\n"
 	if [[ -z ${GIT_USERNAME} ]]; then
 		echo -ne $Bcya"Enter your git username: "
 		read -r NAME
 		git config --global user.name "${NAME}"
 	fi

 	if [[ -z ${GIT_EMAIL} ]]; then
 		echo -ne $Bcya"Enter your git email: "
 		read -r EMAIL
 		git config --global user.email "${EMAIL}"
 	fi

 	git config --global ui.color "true"
	git config --global credential.helper "cache --timeout=7200"
 fi

echo -e $Grn"Git identity setup successfully!"$Res
sleep 2
echo -e ${Mag}"$(git config --list)"${Res}
