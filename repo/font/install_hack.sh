#!/bin/sh

font_path="${HOME}/.local/share/fonts/hack/"
base="https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.0/Hack.zip"

if [ -d "${font_path}" ]; then
    echo "Fonts: Hack + NerdFonts: already installed"
    exit 0
fi

echo "Fonts: Hack + NerdFonts: Installing"
mkdir -p "${font_path}"

temp_file=$(mktemp)
curl -L "${base}" -o "${temp_file}"
unzip "${temp_file}" -d "${font_path}"
echo "Fonts: Hack + NerdFonts: Installed"
