#!/bin/sh
font_path="${HOME}/.local/share/fonts/notofont"
base="https://github.com/googlefonts/noto-emoji/raw/main/fonts/NotoColorEmoji.ttf"

if [ -d "${font_path}" ]; then
    echo "Fonts: NotoFont: already installed"
    exit 0
fi

echo "Fonts: NotoFont: Installing"
mkdir -p "${font_path}"

curl -L "${base}" -o "${font_path}/NotoColorEmoji.ttf"
echo "Fonts: NotoFont: Installed"
