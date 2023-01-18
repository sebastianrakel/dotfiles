#!/bin/sh

font_path="${HOME}/.local/share/fonts/iosevka/"
base="https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.0/Iosevka.zip"

if [ -d "${font_path}" ]; then
    echo "Fonts: Iosevka + NerdFonts: already installed"
    exit 0
fi

echo "Fonts: Iosevka + NerdFonts: Installing"
mkdir -p "${font_path}"

temp_file=$(mktemp)
curl -L "${base}" -o "${temp_file}"
unzip "${temp_file}" -d "${font_path}"
echo "Fonts: Iosevka + NerdFonts: Installed"
