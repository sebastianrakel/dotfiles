#!/bin/bash

create_linksInDir() {
	DEST=$1
	for file in $2; do			
		FILENAME=`basename $file`
		EXT="${FILENAME##*.}"
		if [ $FILENAME != "." ] && [ $FILENAME != ".." ] && 
		   [ $FILENAME != ".config" ] && [ $EXT != "swp" ]; then
			if [ ! -e $DEST/$FILENAME  ]; then 
				echo "ln -s $file ${DEST}/$FILENAME"
			fi
		fi
	done
}

BASEDIR=$(dirname $0)
SCRIPTPATH=`pwd -P`

if [ $BASEDIR == "." ]; then
	BASEDIR=
fi

BASEDIR=${SCRIPTPATH}/${BASEDIR}

create_linksInDir ~ "${BASEDIR}/.*"
create_linksInDir ~/.config "${BASEDIR}/.config/*"
