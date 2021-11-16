#!/bin/env bash
echo "Install Dracula GTK Icons"
download_url="https://github.com/dracula/gtk/files/5214870/Dracula.zip"

mkdir -p "${HOME}/.icons"

if [ ! -d "${HOME}/.icons/Dracula" ]; then
    curl -L -o /tmp/dracula.zip "${download_url}"
    unzip /tmp/dracula.zip -d "${HOME}/.icons/"
fi
