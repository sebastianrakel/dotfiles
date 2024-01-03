#!/bin/sh

echo -n "${1}" | xclip -selection clipboard

notify-send -u normal "copied to clipboard" "${1}" 
