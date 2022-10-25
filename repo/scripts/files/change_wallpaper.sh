#!/usr/bin/env bash

if [ ! -z "${1}" ]; then
    wallpaper="${1}"
else
    wallpaper=$(find "${HOME}/Pictures/Wallpaper/" -type f -print0 | shuf -z -n 1)
fi

echo "Switch to wallpaper: ${wallpaper}"
feh --bg-fill "${wallpaper}"
