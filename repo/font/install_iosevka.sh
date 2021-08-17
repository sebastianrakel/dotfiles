#!/bin/sh

echo "Check for Iosevka"

if [ -e "${HOME}/.local/share/fonts/iosevka-ss08.ttc" ]; then
    exit 0
fi

mkdir -p "${HOME}/.local/share/fonts"

curl -L "https://github.com/be5invis/Iosevka/releases/download/v10.0.0/super-ttc-iosevka-ss08-10.0.0.zip" -o /tmp/iosevka.zip
unzip /tmp/iosevka.zip -d "${HOME}/.local/share/fonts/"
