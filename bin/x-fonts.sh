#!/bin/bash

function add_font_dir {
    dir=${1}
    cd ${dir}
    mkfontdir 
    xset fp+ ${dir}

    for subdir in ${dir}/*; do
        if [[ -d ${subdir} ]]; then
    		add_font_dir ${subdir}
        fi
    done
}

FONTS_DIR=$HOME/.local/share/fonts
START_DIR=$(pwd)

add_font_dir $FONTS_DIR
xset fp rehash
cd $START_DIR
