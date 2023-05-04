#!/usr/bin/env bash

themename="${1}"


if [[ -z "${themename}" ]]; then
    themefiles="${HOME}/.base16-themes/herbstluftwm/*.sh"
    for file in $themefiles
    do
	filename=$(basename "${file}")
	echo "${filename/.sh/}"
    done
    exit 0
fi

base16-activate.sh $themename >/dev/null
exit 0
