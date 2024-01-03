#!/bin/sh

popup_name="${1}"
lock_file="${HOME}/.cache/eww-popup-${popup_name}.lock"

if [[ -f "${lock_file}" ]]; then
    eww close "${popup_name}"
    rm "${lock_file}"
else
    touch "${lock_file}"
    eww open "${popup_name}"
fi
