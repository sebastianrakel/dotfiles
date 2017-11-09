#!/bin/bash

#
# Define Variables
#

localprofile=$HOME/.profile.local

#
# Terminal Settings
#

if [ -z "$TMUX" ]; then
    export TERM=xterm-256color
fi

#
# Ruby Settings
#

if hash ruby 2>/dev/null; then
    PATH="`ruby -e 'print Gem.user_dir'`/bin:$PATH"
fi

#
# Nodejs Settings
#

PATH="$HOME/.node_modules/bin:$PATH"
export npm_config_prefix=~/.node_modules

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

#
# Go Lang Settings
#
export GOPATH="$HOME/.go"
PATH="$PATH:$GOPATH/bin"
export GOBIN=$GOPATH/bin

#
# Extend Path Variable
#

PATH="$HOME/.bin:$PATH"
PATH="$HOME/.bin/local:$PATH"

#
# Base 16 - Color Switching
#

BASE16_SHELL="$HOME/.bin/base16-shell/base16-monokai.dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

b16() {
    BASE16_SHELL="$@"
    [[ -s $BASE16_SHELL ]] && source $BASE16_SHELL
}

if [ -n "$ZSH_VERSION" ]; then
	compdef '_files -g "$HOME/.bin/base16-shell/*"' b16
#elif [ -n "$BASH_VERSION" ]; then
	# todo: auto complete for bash
fi

vim() {
	if [[ "${BASE16_SHELL}" == *".light.sh" ]]; then
		scheme=$(basename "$(echo "${BASE16_SHELL}")" | sed 's/.light.sh*//g')
		/usr/bin/vim "+set background=light" "+colorscheme ${scheme}" "$@"
	elif [[ "${BASE16_SHELL}" == *".dark.sh" ]]; then
		scheme=$(basename "$(echo "${BASE16_SHELL}")" | sed 's/.dark.sh*//g')
		/usr/bin/vim "+colorscheme ${scheme}" "$@"
	fi
}

#
# Environment
#

# export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=lcd'
# export _JAVA_AWT_WM_NONREPARENTING=1

#export VAGRANT_DEFAULT_PROVIDER=libvirt


ANDROID_SDK_HOME="$HOME/Android/Sdk"
if [ -d "$ANDROID_SDK_HOME/platform-tools" ]; then
    PATH="$ANDROID_SDK_HOME/platform-tools:$PATH"
fi

# Editor

export ALTERNATE_EDITOR=emacs
export EDITOR=emacsclient
export VISUAL=emacsclient

# GPG

if [ -e "${HOME}/.bin/gpg-agent.sh" ] ; then
    . "${HOME}/.bin/gpg-agent.sh"
fi
#
# Load local settings
#

if [ -e "$localprofile" ] ; then
    . "$localprofile"
fi

