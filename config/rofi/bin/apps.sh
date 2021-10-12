#!/usr/bin/env bash

theme="apps"
dir="$HOME/.config/rofi/bin"

rofi -no-lazy-grab -show drun \
-modi drun \
-theme $dir/"$theme"

