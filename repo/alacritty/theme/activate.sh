echo "Theme: Alacritty set"
alacritty_theme_path="${HOME}/.config/alacritty/theme.yml"
if [[ -h "${alacritty_theme_path}" ]]; then
    rm "${alacritty_theme_path}"
fi

ln -s "${HOME}/.base16-themes/alacritty/${theme_name}-256.toml" "${alacritty_theme_path}"

touch "${HOME}/.config/alacritty/alacritty.yml"
