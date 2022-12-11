#!/usr/bin/env bash

tools_folder="${HOME}/.tools"
download_url='https://github.com/sumneko/lua-language-server/releases/download/3.6.4/lua-language-server-3.6.4-linux-x64.tar.gz'
destination_folder="${HOME}/.tools/lua-language-server"

if [ ! -d "${tools_folder}" ]; then
	mkdir "${tools_folder}"
fi

if [ -d "${destination_folder}" ]; then
	echo "LUA LSP: Already installed"
	exit 0
fi

echo "LUA LSP: Installing"
tmpfile=$(mktemp)

curl -L "${download_url}" -o "${tmpfile}"

mkdir -p "${destination_folder}"
cd "${destination_folder}"
tar xaf "${tmpfile}"
rm "${tmpfile}"

ln -s "${destination_folder}/bin/lua-language-server" "${HOME}/.bin/lua-language-server"
echo "LUA LSP: Installed"
