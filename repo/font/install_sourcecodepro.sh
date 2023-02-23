#!/bin/sh

font_path="${HOME}/.local/share/fonts/sourcecode/"
base="https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.3/SourceCodePro.zip"

if [ -d "${font_path}" ]; then
    echo "Fonts: Source Code Pro + NerdFonts: already installed"
    exit 0
fi

echo "Fonts: SourceCode Pro + NerdFonts: Installing"
mkdir -p "${font_path}"

temp_file=$(mktemp)
curl -L "${base}" -o "${temp_file}"
unzip "${temp_file}" -d "${font_path}"
echo "Fonts: SourceCode Pro + NerdFonts: Installed"
