alacritty_theme_path="${HOME}/.config/alacritty/theme.yml"
if [[ -h "${alacritty_theme_path}" ]]; then
    rm "${alacritty_theme_path}"
fi

ln -s "${HOME}/.base-16/output/alacritty/${theme_name}.yml" "${alacritty_theme_path}"

touch "${HOME}/.config/alacritty/alacritty.yml"
