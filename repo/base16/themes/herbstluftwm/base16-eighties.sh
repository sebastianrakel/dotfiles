#!/usr/bin/env sh

# Eighties

hlwm_base00='#2d2d2d'
hlwm_base01='#393939'
hlwm_base02='#515151'
hlwm_base03='#747369'
hlwm_base04='#a09f93'
hlwm_base05='#d3d0c8'
hlwm_base06='#e8e6df'
hlwm_base07='#f2f0ec'
hlwm_base08='#f2777a'
hlwm_base09='#f99157'
hlwm_base0A='#ffcc66'
hlwm_base0B='#99cc99'
hlwm_base0C='#66cccc'
hlwm_base0D='#6699cc'
hlwm_base0E='#cc99cc'
hlwm_base0F='#d27b53'

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
