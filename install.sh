#!/bin/sh

files=`find . -mindepth 1 -maxdepth 1 ! -name install.sh ! -name private ! -name dotfiles.sh`

for file in $files; do
  filename=${file//\.\//}
  src=PWD/$filename
  dst=$HOME/.$filename

  if [ -e $dst ]; then
    echo "backing up $filename"
    mv $dst "$HOME/old_$filename"
  fi

  echo "symlinking $filename"
  ln -s $src $dst
done
