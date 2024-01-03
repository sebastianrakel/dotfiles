#!/usr/bin/env sh

# Cupcake

hlwm_base00='#fbf1f2'
hlwm_base01='#f2f1f4'
hlwm_base02='#d8d5dd'
hlwm_base03='#bfb9c6'
hlwm_base04='#a59daf'
hlwm_base05='#8b8198'
hlwm_base06='#72677E'
hlwm_base07='#585062'
hlwm_base08='#D57E85'
hlwm_base09='#EBB790'
hlwm_base0A='#DCB16C'
hlwm_base0B='#A3B367'
hlwm_base0C='#69A9A7'
hlwm_base0D='#7297B9'
hlwm_base0E='#BB99B4'
hlwm_base0F='#BAA58C'

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
