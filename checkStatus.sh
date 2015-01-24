#!/bin/bash

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

`git fetch`

LOCAL_RESULT=$LOCAL
REMOTE_RESULT=$REMOTE
BASE_RESULT=$BASE

if [ "$LOCAL_RESULT" ==  "$REMOTE_RESULT" ]; then
    echo "Up-to-date"
    #clear
elif [ "$LOCAL_RESULT" == "$BASE_RESULT" ]; then
    echo "Need to pull"
elif [ "$REMOTE_RESULT" == "$BASE_RESULT" ]; then
    echo "Need to push"
else
    echo "Diverged"
fi

cd $CURRENT_DIR
