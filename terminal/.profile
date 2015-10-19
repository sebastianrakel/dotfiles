#!/bin/bash

localprofile=$HOME/.profile.local

export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=setting'

if [ -z "$TMUX" ]; then
    export TERM=xterm-256color
fi

if hash ruby 2>/dev/null; then
    PATH="`ruby -e 'print Gem.user_dir'`/bin:$PATH"
fi

PATH="$HOME/.node_modules/bin:$PATH"
export npm_config_prefix=~/.node_modules

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

export GOPATH="$HOME/go"

PATH="$HOME/go/bin:$PATH"
PATH="$HOME/.bin:$PATH"
PATH="$HOME/.bin/local:$PATH"

export VAGRANT_DEFAULT_PROVIDER=libvirt

if [ -e "$localprofile" ] ; then
    source "$localprofile"
fi

