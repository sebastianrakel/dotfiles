#!/bin/sh
echo "Check Noto Fonts"
base=https://github.com/googlefonts/noto-emoji/raw/main/fonts/NotoColorEmoji.ttf
noto_color_emoji="${HOME}/.local/share/fonts/NotoColorEmoji.ttf"

mkdir -p "${HOME}/.local/share/fonts"

if [ ! -e "${noto_color_emoji}" ]; then
    curl -L "${base}" -o "${noto_color_emoji}"
fi
