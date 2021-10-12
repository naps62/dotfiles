#!/usr/bin/env bash
# inspired by: https://github.com/adi1090x/rofi

theme="browser-tabs"
dir="$HOME/.config/rofi/bin"

rofi -no-lazy-grab -show brotab \
-i fuzzy \
-modi brotab:~/.config/rofi/bin/brotab_modi.lua \
-theme $dir/"$theme"

# rofi \
#   -theme ~/.config/rofi/themes/tabs \
#   -i -fuzzy -p "Windows" \
#   -modi brotab:~/.config/rofi/brotab_modi.lua \
#   -show brotab

