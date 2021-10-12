#!/usr/bin/env bash
# inspired by: https://github.com/adi1090x/rofi

theme="emojis.rasi"
dir="$HOME/.config/rofi/bin"

rofimoji --selector-args "-no-lazy-grab -theme $dir/$theme"
