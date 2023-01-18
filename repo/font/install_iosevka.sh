#!/bin/sh

font_path="${HOME}/.local/share/fonts/iosevka"
base="https://github.com/be5invis/Iosevka/releases/download/v17.0.4/super-ttc-iosevka-ss08-17.0.4.zip"

if [ -d "${font_path}" ]; then
    echo "Fonts: Iosevka: already installed"
    exit 0
fi

echo "Fonts: Iosevka: Installing"
mkdir -p "${font_path}"

temp_file=$(mktemp)
curl -L "${base}" -o "${temp_file}"
unzip "${temp_file}" -d "${font_path}"
echo "Fonts: Iosevka: Installed"
