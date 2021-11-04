#!/bin/sh

file=~/.config/gtk-3.0/settings.ini

sed -i 's/gtk-theme-name.*/gtk-theme-name=Arc/' $file

grep -q '^gtk-application-prefer-dark-theme' $file && \
  sed -i 's/gtk-application-prefer-dark-theme.*/gtk-application-prefer-dark-theme=false/' $file || \
  echo 'gtk-application-prefer-dark-theme=false' >> $file
