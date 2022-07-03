#!/usr/bin/env bash

theme_name="${1}"

rm "${HOME}/.config/alacritty/active_theme.yml"
ln -s "${HOME}/.config/alacritty/themes/${theme_name}.yml" "${HOME}/.config/alacritty/active_theme.yml"
