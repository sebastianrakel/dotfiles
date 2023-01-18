#!/bin/sh

font_path="${HOME}/.local/share/fonts/fontawesome"
base="https://use.fontawesome.com/releases/v6.2.1/fontawesome-free-6.2.1-desktop.zip"

if [ -d "${font_path}" ]; then
    echo "Fonts: FontAwesome: already installed"
    exit 0
fi

echo "Fonts: FontAwesome: Installing"
mkdir -p "${font_path}"

temp_file=$(mktemp)
curl -L "${base}" -o "${temp_file}"
unzip "${temp_file}" -d "${font_path}"
echo "Fonts: FontAwesome: Installed"
