#!/bin/sh

theme="apps"
dir="$HOME/.config/rofi/bin"

rofi -no-lazy-grab -show window \
  -i fuzzy \
  -theme $dir/"$theme"
