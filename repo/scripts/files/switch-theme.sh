#!/bin/bash

theme="${1}"

if [ -z "${LIGHT_THEME}" ]; then
    echo "LIGHT_THEME not set"
    exit 1
fi

if [ -z "${DARK_THEME}" ]; then
    echo "DARK_THEME not set"
    exit 1
fi

case "${theme}" in
    "light")
	changing_theme="${LIGHT_THEME}"
	;;
    "dark")
	changing_theme="${DARK_THEME}"
	;;
    *)
	echo "Wrong theme, choose light/dark"
	exit 1
	;;
esac

echo "Switching to ${theme} theme"
echo "Switching emacs theme"
emacsclient -e "(switch-theme '${changing_theme})"
echo "Switching alacritty theme"
alacritty-theme-switch "${changing_theme}"
echo "Switching polybar theme"
polybar-theme-switch "dracula"
echo "Switching hlwm theme"
hlwm-theme-switch.sh "dracula"

exit 0
