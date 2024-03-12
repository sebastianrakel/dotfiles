#!/usr/bin/env sh
destination_path="$HOME/.zsh/pure"

if [ -d "${destination_path}" ]; then
    exit 0
fi

git clone https://github.com/sindresorhus/pure.git 
