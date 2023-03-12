#!/bin/sh

theme_path="${HOME}/.themes/FlatColor"
base="https://github.com/jasperro/FlatColor/archive/refs/heads/master.zip"

if [ -d "${theme_path}" ]; then
    echo "Theme: FlatColor: already installed"
    exit 0
fi

echo "Theme: FlatColor: Installing"

temp_file=$(mktemp)
curl -L "${base}" -o "${temp_file}"
unzip "${temp_file}" -d "${HOME}/.themes/"
mv "${HOME}/.themes/FlatColor-master" "${theme_path}"
echo "Theme: FlatColor: Installed"
