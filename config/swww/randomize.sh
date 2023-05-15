#!/bin/bash

# This script will randomly go through the files of a directory, setting it
# up as the wallpaper at regular intervals

# Edit bellow to control the images transition
export SWWW_TRANSITION_FPS=60
export SWWW_TRANSITION_STEP=2

ls ~/.wallpapers/ | sort -R | tail -1 | while read file; do
  swww img "/home/naps62/.wallpapers/$file"
done
