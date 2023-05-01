#!/usr/bin/env sh

# Monokai

hlwm_base00='#272822'
hlwm_base01='#383830'
hlwm_base02='#49483e'
hlwm_base03='#75715e'
hlwm_base04='#a59f85'
hlwm_base05='#f8f8f2'
hlwm_base06='#f5f4f1'
hlwm_base07='#f9f8f5'
hlwm_base08='#f92672'
hlwm_base09='#fd971f'
hlwm_base0A='#f4bf75'
hlwm_base0B='#a6e22e'
hlwm_base0C='#a1efe4'
hlwm_base0D='#66d9ef'
hlwm_base0E='#ae81ff'
hlwm_base0F='#cc6633'

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
