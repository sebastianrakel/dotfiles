#!/bin/sh

CURRENT_DIR=$(pwd)
SCRIPT_PATH=$0
GIT_DIR=$1

cd $GIT_DIR

LOCAL=$(git rev-parse @)
REMOTE=$(git rev-parse @{u})
BASE=$(git merge-base @ @{u})

echo "Dotfiles Version Check v0.1"
echo "Current Dir: $CURRENT_DIR"
echo "Git Dir: $GIT_DIR"

if [ $LOCAL = $REMOTE ]; then
    echo "Up-to-date"
    clear
elif [ $LOCAL = $BASE ]; then
    echo "Need to pull"
elif [ $REMOTE = $BASE ]; then
    echo "Need to push"
else
    echo "Diverged"
fi

cd $CURRENT_DIR
