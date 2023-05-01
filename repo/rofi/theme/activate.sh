rofi_theme_path="${HOME}/.config/rofi/theme.rasi"
if [[ -h "${rofi_theme_path}" ]]; then
    rm "${rofi_theme_path}"
fi

ln -s "${HOME}/.base-16/output/rofi/${theme_name}.rasi" "${rofi_theme_path}"
