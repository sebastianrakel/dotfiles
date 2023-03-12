#!/usr/bin/env sh

theme_name="${1}"

rm "${HOME}/.config/eww/active_theme.scss"
ln -s "${HOME}/.config/eww/themes/${theme_name}.scss" "${HOME}/.config/eww/active_theme.scss"
