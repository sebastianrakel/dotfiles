#!/bin/sh

font_path="${HOME}/.local/share/fonts/monaspace"
base="https://github.com/githubnext/monaspace/releases/download/v1.000/monaspace-v1.000.zip"

if [ -d "${font_path}" ]; then
    echo "Fonts: Monaspace: already installed"
    exit 0
fi

echo "Fonts: Monaspace: Installing"

temp_file=$(mktemp)
temp_dir=$(mktemp -d)

curl -L "${base}" -o "${temp_file}"
unzip "${temp_file}" -d "${temp_dir}"
cp -R "${temp_dir}/monaspace-v1.000/fonts/otf" "${font_path}"
echo "Fonts: Monaspace: Installed"
