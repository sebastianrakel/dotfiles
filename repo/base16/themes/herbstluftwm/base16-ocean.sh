#!/usr/bin/env sh

# Ocean

hlwm_base00='#2b303b'
hlwm_base01='#343d46'
hlwm_base02='#4f5b66'
hlwm_base03='#65737e'
hlwm_base04='#a7adba'
hlwm_base05='#c0c5ce'
hlwm_base06='#dfe1e8'
hlwm_base07='#eff1f5'
hlwm_base08='#bf616a'
hlwm_base09='#d08770'
hlwm_base0A='#ebcb8b'
hlwm_base0B='#a3be8c'
hlwm_base0C='#96b5b4'
hlwm_base0D='#8fa1b3'
hlwm_base0E='#b48ead'
hlwm_base0F='#ab7967'

herbstclient chain , \
	, attr theme.color                        "${hlwm_base07}" \
	, attr theme.background_color             "${hlwm_base00}" \
	, attr theme.normal.color                 "${hlwm_base01}" \
	, attr theme.active.color                 "${hlwm_base08}" \
	, attr theme.active.background_color      "${hlwm_base00}" \
	, attr theme.urgent.color                 "${hlwm_base0A}" \
	, attr theme.floating.active.color        "${hlwm_base08}" \
	, attr theme.floating.urgent.color        "${hlwm_base0A}" \
	, attr theme.floating.background_color    "${hlwm_base00}" \
	, attr settings.frame_bg_normal_color     "${hlwm_base00}" \
	, attr settings.frame_bg_active_color     "${hlwm_base08}" \
	, attr settings.frame_border_normal_color "${hlwm_base00}" \
	, attr settings.frame_border_active_color "${hlwm_base08}" \
	, attr theme.title_color                  "${hlwm_base07}" \
	, attr theme.active.title_color		  "${hlwm_base07}"
