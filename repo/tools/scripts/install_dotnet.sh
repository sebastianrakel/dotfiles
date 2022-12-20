#!/usr/bin/env bash

destination="${HOME}/.bin/dotnet-install.sh"

if [ -e "${destination}" ]; then
    echo "Dotnet Installer already exists"
    exit 0
fi

curl -L https://dot.net/v1/dotnet-install.sh -o "${destination}"

chmod +x "${destination}"
echo "Dotnet Installer installed"
