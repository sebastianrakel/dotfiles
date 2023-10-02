#!/bin/sh


nerd_font_version='3.0.2'
nerd_fonts=( 'BigBlueTerminal' 'Iosevka' 'SourceCodePro' 'Hack' 'NerdFontsSymbolsOnly' )


font_base_path="${HOME}/.local/share/fonts"

for font in "${nerd_fonts[@]}"; do
    download_url="https://github.com/ryanoasis/nerd-fonts/releases/download/v${nerd_font_version}/${font}.tar.xz"
    font_path="${font_base_path}/${font}"

    if [ -d "${font_path}" ]; then
	echo "Fonts: NerdFont: ${font} already installed"
	continue
    fi

    echo "Fonts: NerdFont: ${font} Installing"
    mkdir -p "${font_path}"


    temp_file=$(mktemp)
    curl -L "${download_url}" -o "${temp_file}"
    tar xaf "${temp_file}" -C "${font_path}"
    echo "Fonts: NerdFont: ${font} Installed"
done

fc-cache -fr
