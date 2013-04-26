#!/bin/bash

BASEDIR=$(dirname $0)

clone_repo() {
	repo_url=$1
	dest_dir=$2

	if [[ -e $dest_dir ]]; then
		echo "Destination exists $dest_dir"
		return 0
	fi

	git clone "$repo_url" "$dest_dir"
}

clone_repo https://github.com/scrooloose/nerdtree.git $BASEDIR/bundle/nerdtree
clone_repo git://github.com/altercation/vim-colors-solarized.git $BASEDIR/bundle/vim-colors-solarized

clone_repo git://github.com/nanotech/jellybeans.vim.git $BASEDIR/colors/jellybeans

