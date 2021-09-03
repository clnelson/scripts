#!/data/data/com.termux/files/usr/bin/env bash

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
	sleep 2
 	if [[ -z ${GIT_USERNAME} ]]; then
 		echo -ne ${Bcya}"Enter your git username: "
 		read -r NAME
 		git config --global user.name "${NAME}"
 	fi

 	if [[ -z ${GIT_EMAIL} ]]; then
 		echo -ne ${Bcya}"Enter your git email: "
 		read -r EMAIL
 		git config --global user.email "${EMAIL}"
 	fi
 fi

echo -e ${Grn}"Git identity setup successfully!"${Res}
sleep 2
echo -e ${Mag}"$(git config --list)"${Res}

## Git configuration variables for my system
git config --global core.editor "nano"
git config --global branch.autoSetupRebase "remote"
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
git config --global color.interactive.header "yellow"
git config --global color.interactive.help "bold magenta"
git config --global color.interactive.error "bold red"
git config --global color.pager "true"
git config --global color.showBranch "always"
git config --global color.status "always"
git config --global color.status.header "bold white"
git config --global color.status.added "green"
git config --global color.status.changed "yellow"
git config --global color.status.untracked "bold black"
git config --global color.status.branch "cyan"
git config --global color.status.nobranch "red"
git config --global color.status.localBranch "white"
git config --global color.status.remoteBranch "red"
git config --global color.status.unmerged "magenta"
git config --global color.ui "always"
git config --global column.ui "always"
git config --global column.status "always"
git config --global column.tag "always"
git config --global diff.algorithm "minimal"
git config --global fetch.prune "true"
git config --global fetch.output "compact"
git config --global format.pretty "always"
git config --global merge.conflictStyle "diff3"
git config --global merge.log "true"
git config --global merge.tool "bc"
git config --global rebase.stat "true"
git config --global rebase.autoStash "true"
git config --global rerere.autoUpdate "true"
git config --global rerere.enabled "true"
git config --global credential.helper "cache --timeout=7200"
