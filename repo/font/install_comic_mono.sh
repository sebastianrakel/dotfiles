#!/bin/sh
echo "Check Comic Font"
base=https://raw.githubusercontent.com/dtinth/comic-mono-font/master/
comic_shanns_source=https://github.com/shannpersand/comic-shanns/raw/master/v2/comic%20shanns%202.ttf
comic_bold="${HOME}/.local/share/fonts/ComicMono-Bold.ttf"
comic="${HOME}/.local/share/fonts/ComicMono.ttf"
comic_shanns="${HOME}/.local/share/fonts/comic shanns 2.ttf"

mkdir -p "${HOME}/.local/share/fonts"

if [ ! -e "${comic}" ]; then
    curl -L "${base}ComicMono.ttf" -o "${comic}"
fi

if [ ! -e "${comic_bold}" ]; then
    curl -L "${base}ComicMono-Bold.ttf" -o "${comic_bold}"
fi

if [ ! -e "${comic_shanns}" ]; then
    curl -L "${comic_shanns_source}" -o "${comic_shanns}"
fi
