#!/bin/sh

echo "Check for Awesome 5"

if [[ -d "${HOME}/.local/share/fonts/fontawesome-free-5.15.4-desktop/" ]]; then
    echo "FontAwesome already installed"
    exit 0
fi

mkdir -p "${HOME}/.local/share/fonts"

curl -L "https://use.fontawesome.com/releases/v5.15.4/fontawesome-free-5.15.4-desktop.zip" -o /tmp/awesome.zip
unzip /tmp/awesome.zip -d "${HOME}/.local/share/fonts/"
