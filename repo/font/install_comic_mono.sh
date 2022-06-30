#!/bin/sh
echo "Check Comic Font"
base=https://raw.githubusercontent.com/dtinth/comic-mono-font/master/
comic_bold="${HOME}/.local/share/fonts/ComicMono-Bold.ttf"
comic="${HOME}/.local/share/fonts/ComicMono.ttf"

mkdir -p "${HOME}/.local/share/fonts"

if [ ! -e "${comic}" ]; then
    curl -L "${base}ComicMono.ttf" -o "${comic}"
fi

if [ ! -e "${comic_bold}" ]; then
    curl -L "${base}ComicMono-Bold.ttf" -o "${comic_bold}"
fi
