#!/usr/bin/env sh

# Gruvbox dark, medium

hlwm_base00='#282828'
hlwm_base01='#3c3836'
hlwm_base02='#504945'
hlwm_base03='#665c54'
hlwm_base04='#bdae93'
hlwm_base05='#d5c4a1'
hlwm_base06='#ebdbb2'
hlwm_base07='#fbf1c7'
hlwm_base08='#fb4934'
hlwm_base09='#fe8019'
hlwm_base0A='#fabd2f'
hlwm_base0B='#b8bb26'
hlwm_base0C='#8ec07c'
hlwm_base0D='#83a598'
hlwm_base0E='#d3869b'
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
