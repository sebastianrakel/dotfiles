#!/bin/bash

BASEDIR=$(dirname $0)

for file in $BASEDIR/.*; do
	FILENAME=`basename $file`
	if [ $FILENAME != "." ] && [ $FILENAME != ".." ]; then
		if [ -a ~/$FILENAME  ]; then 
			echo "File ~/$FILENAME already exist"
		else
			echo "Link $file to $FILENAME"
			ln -s $file ~/$FILENAME
		fi
	fi
done
