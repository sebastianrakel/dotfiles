#!/bin/bash

export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=setting'

if hash ruby 2>/dev/null; then
    PATH="`ruby -e 'print Gem.user_dir'`/bin:$PATH"
fi

export GOPATH=~/go

PATH=$PATH:~/go/bin
PATH=$PATH:~/.bin

