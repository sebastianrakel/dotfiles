#!/bin/sh

theme_path="${HOME}/.themes/base16-gtk"
base="https://github.com/sebastianrakel/base16-gtk"

if [ -d "${theme_path}" ]; then
    echo "Theme: Base16 GTK: already installed"
    exit 0
fi

echo "Theme: Base16 GTK: Installing"

temp_file=$(mktemp)
git clone "${base}" "${theme_path}"
cd "${theme_path}"
git submodule update --init
echo "Theme: Base 16 GTK: Installed"
