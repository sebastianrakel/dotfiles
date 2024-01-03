#!/usr/bin/env sh

# Gruvbox dark, pale

hlwm_base00='#262626'
hlwm_base01='#3a3a3a'
hlwm_base02='#4e4e4e'
hlwm_base03='#8a8a8a'
hlwm_base04='#949494'
hlwm_base05='#dab997'
hlwm_base06='#d5c4a1'
hlwm_base07='#ebdbb2'
hlwm_base08='#d75f5f'
hlwm_base09='#ff8700'
hlwm_base0A='#ffaf00'
hlwm_base0B='#afaf00'
hlwm_base0C='#85ad85'
hlwm_base0D='#83adad'
hlwm_base0E='#d485ad'
hlwm_base0F='#d65d0e'

herbstclient chain , \
	, attr theme.color                        "${hlwm_base07}" \
	, attr theme.background_color             "${hlwm_base00}" \
	, attr theme.normal.color                 "${hlwm_base01}" \
	, attr theme.active.color                 "${hlwm_base03}" \
	, attr theme.active.background_color      "${hlwm_base00}" \
	, attr theme.urgent.color                 "${hlwm_base08}" \
	, attr theme.floating.active.color        "${hlwm_base03}" \
	, attr theme.floating.urgent.color        "${hlwm_base08}" \
	, attr theme.floating.background_color    "${hlwm_base00}" \
	, attr settings.frame_bg_normal_color     "${hlwm_base00}" \
	, attr settings.frame_bg_active_color     "${hlwm_base03}" \
	, attr settings.frame_border_normal_color "${hlwm_base00}" \
	, attr settings.frame_border_active_color "${hlwm_base03}" \
	, attr theme.title_color                  "${hlwm_base07}" \
	, attr theme.active.title_color		  "${hlwm_base05}"
