#!/usr/bin/env sh

# Material Palenight

hlwm_base00='#292D3E'
hlwm_base01='#444267'
hlwm_base02='#32374D'
hlwm_base03='#676E95'
hlwm_base04='#8796B0'
hlwm_base05='#959DCB'
hlwm_base06='#959DCB'
hlwm_base07='#FFFFFF'
hlwm_base08='#F07178'
hlwm_base09='#F78C6C'
hlwm_base0A='#FFCB6B'
hlwm_base0B='#C3E88D'
hlwm_base0C='#89DDFF'
hlwm_base0D='#82AAFF'
hlwm_base0E='#C792EA'
hlwm_base0F='#FF5370'

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
