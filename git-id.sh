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

	echo -ne ${Bwhi}"Configuring git!\n\n"
 	if [[ -z ${GIT_USERNAME} ]]; then
 		echo -e ${Bcya}"Enter your git username: "
 		read -r NAME
 		git config --global user.name "${NAME}"
 	fi

 	if [[ -z ${GIT_EMAIL} ]]; then
 		echo -e ${Bcya}"Enter your git email: "
 		read -r EMAIL
 		git config --global user.email "${EMAIL}"
 	fi
 fi

echo -e ${Grn}"Git identity setup successfully!"${Res}
sleep 2
echo -e ${Mag}"$(git config --list)"${Res}

## Git configuration variables for my system
git config --global core.editor "nano"
git congig --global branch.autoSetupRebase "remote"
git config --global ui.color "true"
git config --global color.branch "always"
git config --global color.diff "always"
git config --global diff.colorMoved "true"
git config --global color.diff.plain "bold white"
git config --global color.diff.meta "magenta"
git config --global color.diff.frag "bold yellow"
git config --global color.diff.old "red"
git config --global color.diff.new "green"
git config --global color.diff.commit "bold green"
git config --global color.diff.whitespace "red"
git config --global color.diff.oldMoved "red"
git config --global color.diff.newMoved "green"
git config --global color.diff.oldMovedDimmed "bold white"
git config --global color.diff.oldMovedAlternative "bold yellow"
git config --global color.diff.oldMovedAlternativeDimmed "bold green"
git config --global color.diff.newMovedDimmed "green"
git config --global color.diff.newMovedAlternative "blue"
git config --global color.diff.newMovedAlternativeDimmed "magenta"
git config --global color.decorate.branch "cyan"
git config --global color.decorate.remoteBranch "red"
git config --global color.decorate.tag "green"
git config --global color.decorate.stash "yellow"
git config --global color.decorate.HEAD "white"
git config --global color.grep "always"
git config --global color.grep.context "bold red"
git config --global color.grep.filename "yellow"
git config --global color.grep.function "white"
git config --global color.grep.linenumber "bold cyan"
git config --global color.grep.match "bold green"
git config --global color.grep.matchContext "bold green"
git config --global color.grep.matchSelected "bold green"
git config --global color.grep.selected "bold black"
git config --global color.grep.separator "bold yellow"
git config --global color.interactive "always"
git config --global color.interactive.prompt "bold white"
get config --global color.interactive.header "yellow"
get config --global color.interactive.help "bold magenta"
get config --global color.interactive.error "bold red"
get config --global color.pager "enable"
get config --global color.showBranch "always"
get config --global color.status "always"
get config --global color.status.header "bold white"
get config --global color.status.added "green"
get config --global color.status.changed "yellow"
get config --global color.status.untracked "bold black"
get config --global color.status.branch "cyan"
get config --global color.status.nobranch "red"
get config --global color.status.localBranch "white"
get config --global color.status.remoteBranch "red"
get config --global color.status.unmerged "magenta"
get config --global color.ui "always"
get config --global column.ui "always"
get config --global column.status "always"
get config --global column.tag "always"
get config --global diff.algorithm "minimal"
get config --global fetch.prune "true"
get config --global fetch.output "compact"
get config --global format.pretty "always"
get config --global help.format "web"
get config --global help.browser "firefox"
get config --global merge.conflictStyle "diff3"
get config --global merge.log "true"
get config --global merge.tool "bc"
get config --global rebase.stat "true"
get config --global rebase.autoStash "true"
get config --global rerere.autoUpdate "true"
git config --global rerere.enabled "true"
git config --global credential.helper "cache --timeout=7200"
