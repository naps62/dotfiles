#!/bin/sh

monitors=$(hyprctl monitors -j | jq -r ".[] | .name")

for m in $monitors; do
  img=$(find ~/.config/variety/Downloaded -type f | grep -v json | shuf -n 1)
  hyprctl hyprpaper preload $img
  hyprctl hyprpaper wallpaper "$m,$img"
done
