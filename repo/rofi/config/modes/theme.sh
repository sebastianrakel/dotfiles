#!/usr/bin/env bash

themename="${1}"


if [[ -z "${themename}" ]]; then
    themefiles="${HOME}/.base16-themes/alacritty/*.yml"
    for file in $themefiles
    do
	filename=$(basename "${file}")
	echo "${filename/.yml/}"
    done
    exit 0
fi

base16-activate.sh $themename >/dev/null
exit 0
