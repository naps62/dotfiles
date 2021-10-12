#!/usr/bin/env bash

## rofi-screenshot
## Author: ceuk @ github
## Licence: WTFPL
## Usage: 
##    show the menu with rofi-screenshot
##    stop recording with rofi-screenshot -s

# Screenshot directory
screenshot_directory="$HOME/downloads/screenshots"

# set ffmpeg defaults
ffmpeg() {
    command ffmpeg -hide_banner -loglevel error -nostdin "$@"
}

video_to_gif() {
    ffmpeg -i "$1" -vf palettegen -f image2 -c:v png - |
    ffmpeg -i "$1" -i - -filter_complex paletteuse "$2"
}

slop_geometry() {
  slop --nodecorations --format='-g %g ' --color=0.5,0.5,0.5,0.1 --highlight --noopengl
}

countdown() {
  counter=$1

  if [[ "$counter" -gt "0" ]]; then
    notify-send "Screenshot" "Shooting in $counter seconds" -t 1000
    sleep 1
    countdown $(($counter - 1))
  fi
}

print_region_clip() {
  delay=$1

  notify-send "Screenshot" "Select a region to capture"
  ffcast -q $(slop_geometry && countdown $delay) png /tmp/screenshot_clip.png
  xclip -selection clipboard -t image/png /tmp/screenshot_clip.png
  rm /tmp/screenshot_clip.png
  notify-send "Screenshot" "Region copied to Clipboard"
}

print_region_file() {
  delay=$1

  countdown $delay
  notify-send "Screenshot" "Select a region to capture"
  dt=$(date '+%d-%m-%Y_%H:%M:%S')
  echo "print"
  ffcast -q $(slop_geometry && countdown $delay) png "$screenshot_directory/$dt.png"
  echo "print"
  notify-send "Screenshot" "Region saved to $screenshot_directory"
}

print_screen_chip() {
  sleep 1
  ffcast -q png /tmp/screenshot_clip.png
  xclip -selection clipboard -t image/png /tmp/screenshot_clip.png
  rm /tmp/screenshot_clip.png
  notify-send "Screenshot" "Screenshot copied to Clipboard"
}

print_screen_file() {
  sleep 1
  dt=$(date '+%d-%m-%Y_%H:%M:%S')
  ffcast -q png "$screenshot_directory/$dt.png"
  notify-send "Screenshot" "Screenshot saved to $screenshot_directory"
}

record_region_file_gif() {
  notify-send "Screenshot" "Select a region to record"
  dt=$(date '+%d-%m-%Y_%H:%M:%S')
  ffcast -q $(slop_geometry && countdown) rec /tmp/screenshot_gif.mp4
  notify-send "Screenshot" "Converting to gif... (this can take a while)"
  video_to_gif /tmp/screenshot_gif.mp4 "$screenshot_directory/$dt.gif"
  rm /tmp/screenshot_gif.mp4
  notify-send "Screenshot" "Recording saved to $screenshot_directory"
}

record_screen_file_gif() {
  countdown
  dt=$(date '+%d-%m-%Y_%H:%M:%S')
  ffcast -q rec /tmp/screenshot_gif.mp4
  notify-send "Screenshot" "Converting to gif... (this can take a while)"
  video_to_gif /tmp/screenshot_gif.mp4 "$screenshot_directory/$dt.gif"
  rm /tmp/screenshot_gif.mp4
  notify-send "Screenshot" "Recording saved to $screenshot_directory"
}

record_region_file_mp4() {
  notify-send "Screenshot" "Select a region to record"
  dt=$(date '+%d-%m-%Y_%H:%M:%S')
  ffcast -q $(slop_geometry && countdown) rec "$screenshot_directory/$dt.mp4"
  notify-send "Screenshot" "Recording saved to $screenshot_directory"
}

record_screen_file_mp4() {
  countdown
  dt=$(date '+%d-%m-%Y_%H:%M:%S')
  ffcast -q rec "$screenshot_directory/$dt.mp4"
  notify-send "Screenshot" "Recording saved to $screenshot_directory"
}

get_options() {
  echo "  Capture Region  Clip"
  echo "  Capture Region  File"
  echo "  Capture Region w/ Delay  Clip"
  echo "  Capture Region w/ Delay  File"
  echo "  Capture Screen  Clip"
  echo "  Capture Screen  File"
  echo "  Capture Screen w/ Delay  Clip"
  echo "  Capture Screen w/ Delay  File"
  echo "  Record Region  File (GIF)"
  echo "  Record Screen  File (GIF)"
  echo "  Record Region  File (MP4)"
  echo "  Record Screen  File (MP4)"
}

check_deps() {
  if ! hash $1 2>/dev/null; then
    echo "Error: This script requires $1"
    exit 1
  fi
}

main() {
  # check dependencies
  check_deps slop
  check_deps ffcast
  check_deps ffmpeg
  check_deps xclip
  check_deps rofi

  if [[ $1 == '--help' ]] || [[ $1 = '-h' ]]
  then
    echo ### rofi-screenshot
    echo USAGE: rofi-screenshot [OPTION]
    echo \(no option\)
    echo "    show the screenshot menu"
    echo -s, --stop
    echo "    stop recording"
    echo -h, --help
    echo "    this screen"
    exit 1
  fi

  if [[ $1 = '--stop' ]] || [[ $1 = '-s' ]]
  then
    pkill -fxn '(/\S+)*ffmpeg\s.*\sx11grab\s.*'
    exit 1
  fi

  theme="screenshots.rasi"
  dir="$HOME/.config/rofi/bin"
  # Get choice from rofi
  choice=$( (get_options) | rofi -theme "$dir/$theme" -dmenu -i -fuzzy -p "Screenshot" )

  # If user has not picked anything, exit
  if [[ -z "${choice// }" ]]; then
      exit 1
  fi

  # run the selected command
  case $choice in
    '  Capture Region  Clip')
      print_region_clip 0
      ;;
    '  Capture Region  File')
      print_region_file 0
      ;;
    '  Capture Region w/ Delay  Clip')
      print_region_clip 3
      ;;
    '  Capture Region w/ Delay  File')
      print_region_file 3
      ;;
    '  Capture Screen  Clip')
      print_screen_chip
      ;;
    '  Capture Screen  File')
      print_screen_file
      ;;
    '  Record Region  File (GIF)')
      record_region_file_gif
      ;;
    '  Record Screen  File (GIF)')
      record_screen_file_gif
      ;;
    '  Record Region  File (MP4)')
      record_region_file_mp4
      ;;
    '  Record Screen  File (MP4)')
      record_screen_file_mp4
      ;;
  esac

  # done
  set -e
}

main $1 &

exit 0

!/bin/bash


