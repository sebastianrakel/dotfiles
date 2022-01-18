#!/bin/sh
echo "Check Nerd Fonts"
base=https://raw.githubusercontent.com/ryanoasis/nerd-fonts/d0bf73a19c3459aab39734a05159e2694911d7d6/src/glyphs/
nerdfont_1000="${HOME}/.local/share/fonts/Symbols-1000-em_Nerd_Font_Complete.ttf"
nerdfont_2048="${HOME}/.local/share/fonts/Symbols-2048-em_Nerd_Font_Complete.ttf"

mkdir -p "${HOME}/.local/share/fonts"

if [ ! -e "${nerdfont_1000}" ]; then
    curl -L "${base}Symbols-1000-em%20Nerd%20Font%20Complete.ttf" -o "${nerdfont_1000}"
fi

if [ ! -e "${nerdfont_2048}" ]; then
    curl -L "${base}Symbols-2048-em%20Nerd%20Font%20Complete.ttf" -o "${nerdfont_2048}"
fi
