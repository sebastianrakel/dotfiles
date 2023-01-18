#!/bin/sh

font_path="${HOME}/.local/share/fonts/fontawesome5"
base="https://use.fontawesome.com/releases/v5.15.4/fontawesome-free-5.15.4-desktop.zip"

if [ -d "${font_path}" ]; then
    echo "Fonts: FontAwesome 5: already installed"
    exit 0
fi

echo "Fonts: FontAwesome 5: Installing"
mkdir -p "${font_path}"

temp_file=$(mktemp)
curl -L "${base}" -o "${temp_file}"
unzip "${temp_file}" -d "${font_path}"
echo "Fonts: FontAwesome 5: Installed"
