#!/usr/bin/env sh

# Github

hlwm_base00='#ffffff'
hlwm_base01='#f5f5f5'
hlwm_base02='#c8c8fa'
hlwm_base03='#969896'
hlwm_base04='#e8e8e8'
hlwm_base05='#333333'
hlwm_base06='#ffffff'
hlwm_base07='#ffffff'
hlwm_base08='#ed6a43'
hlwm_base09='#0086b3'
hlwm_base0A='#795da3'
hlwm_base0B='#183691'
hlwm_base0C='#183691'
hlwm_base0D='#795da3'
hlwm_base0E='#a71d5d'
hlwm_base0F='#333333'

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
