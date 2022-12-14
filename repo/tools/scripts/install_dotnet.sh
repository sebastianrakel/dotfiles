#!/usr/bin/env bash

destination="${HOME}/.bin/local/dotnet-install.sh"

curl https://dot.net/v1/dotnet-install.sh -O "${destination}"

chmod +x "${destination}"
