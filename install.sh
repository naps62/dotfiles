#!/bin/sh

files=`find . -mindepth 1 -maxdepth 1 ! -name install.sh`

for file in $files; do
	filename=${file//\.\//}
	echo "symlinking $filename"
	ln -s "$PWD/$filename" "$HOME/.$filename"
done
