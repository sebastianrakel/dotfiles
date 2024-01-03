#!/usr/bin/env sh

# Gruvbox light, soft

hlwm_base00='#f2e5bc'
hlwm_base01='#ebdbb2'
hlwm_base02='#d5c4a1'
hlwm_base03='#bdae93'
hlwm_base04='#665c54'
hlwm_base05='#504945'
hlwm_base06='#3c3836'
hlwm_base07='#282828'
hlwm_base08='#9d0006'
hlwm_base09='#af3a03'
hlwm_base0A='#b57614'
hlwm_base0B='#79740e'
hlwm_base0C='#427b58'
hlwm_base0D='#076678'
hlwm_base0E='#8f3f71'
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
