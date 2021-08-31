#!/data/data/com.termux/files/usr/bin/env bash
git config --global ui.color "true"

git config --global user.name "clnelson"
git config --global user.email \
	"dumb.droid.dev@outlook.com"

# Git CLI no longer supports password
# authentication
git config --global remote.url \
	"https://github.com"
git config --global remote.token \
	"$GIT_TOKEN"
git config --global credential.helper \
	"cache --timeout=7200"
