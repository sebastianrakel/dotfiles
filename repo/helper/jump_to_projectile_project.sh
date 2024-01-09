#!/usr/bin/env bash

content=$(<"${HOME}/.emacs.d/projectile-bookmarks.eld")

ignore_paths=( ".emacs.d/straight" "" )

options=()

for line in $content; do
    project=$(sed "s/(//g" <<< "$line")
    project=$(sed "s/)//g" <<< "$project")
    
    projectname=$(sed "s/\"//g" <<< "$project")

    projectname=$(basename "${projectname}")

    ignored=false
    for ignore in $ignore_paths; do
	if [[ "${project}" == *"${ignore}"* ]]; then
	    ignored=true
	fi
    done

    if [ "${ignored}" = false ]; then
	options+=($project)
    fi
done

fzf < $(echo "${options[@]}")
