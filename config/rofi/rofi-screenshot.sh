#!/usr/bin/env bash

## rofi-screenshot
## Author: ceuk @ github
## Licence: WTFPL
## Usage:
##    show the menu with rofi-screenshot
##    stop recording with rofi-screenshot -s

# Screenshot directory
dir="$HOME/downloads/screenshots"
title=$(hyprctl activewindow -j | jq -r '.title' | tr '/' '-')
recorder_flag="$HOME/.cache/rofi-screenshot-recording"

# Default date format
default_date_format="+%d-%m-%Y_%H:%M:%S"

# set ffmpeg defaults
ffmpeg() {
  command ffmpeg -hide_banner -loglevel error -nostdin "$@"
}

video_to_gif() {
  ffmpeg -i "$1" -vf palettegen -f image2 -c:v png - |
    ffmpeg -i "$1" -i - -filter_complex paletteuse "$2"
}

countdown() {
  n_id=$1
  $title=$2

  notify-send --app-name="screenshot" "$title" "Recording in 3" -t 1000 --replace-id=$n_id
  sleep 1
  notify-send --app-name="screenshot" "$title" "Recording in 2" -t 1000 --replace-id=$n_id
  sleep 1
  notify-send --app-name="screenshot" "$title" "Recording in 1" -t 1000 --replace-id=$n_id
  sleep 1
}

screenshot_region_copysave() {
  path="${dir}/${1}-${title}.png"
  title="Region Clip"

  n_id=$(notify-send --app-name="screenshot" "$title" "Select a region to capture" --print-id)

  grimblast copysave area "$path"

  notify-send --app-name="screenshot" "$title" "$path" --replace-id=$n_id
}

record_region_gif() {
  tmppath="${dir}/tmp-${1}-${title}.mp4"
  path="${dir}/${1}-region-${title}.gif"
  title="Region Gif"

  n_id=$(notify-send --app-name="screenshot" "$title" "Select a region to record" --print-id)

  touch "$recorder_flag"
  wf-recorder -g "$(slurp && countdown $n_id "$title")" -f "$tmppath"

  notify-send --app-name="screenshot" "$title" "Converting to gif… (can take a while)" --replace-id=$n_id
  video_to_gif "$tmppath" "$path"
  rm "$tmppath"

  notify-send --app-name="screenshot" "$title" "$path" --replace-id=$n_id
}

record_region_mp4() {
  path="${dir}/${1}-${title}.mp4"
  title="Region MP4"

  n_id=$(notify-send --app-name="screenshot" "$title" "Select a region to record" --print-id)

  touch "$recorder_flag"
  wf-recorder -g "$(slurp && countdown $n_id "$title")" -f "$path"

  notify-send --app-name="screenshot" "$title" "$path" --replace-id=$n_id
}

stop_recording() {
  pkill --signal int wf-recorder
  rm "$recorder_flag"
}

get_options() {
  echo "     Screenshot"
  echo "     Gif"
  echo "     MP4"
  echo "     Stop recording"
}

check_deps() {
  if ! hash "$1" 2> /dev/null; then
    echo "Error: This script requires $1"
    exit 1
  fi
}

show_help() {
  echo ### rofi-screenshot
  echo "USAGE: rofi-screenshot [OPTION] <argument>"
  echo "(no option)"
  echo "    show the screenshot menu"
  echo "-s, --stop"
  echo "    stop recording"
  echo "-h, --help"
  echo "    this screen"
  echo "-d, --directory <directory>"
  echo "    set the screenshot directory"
  echo "-t, --timestamp <format>"
  echo "    set the format used for timestamps, in the format the date"
  echo "    command expects (default '+%d-%m-%Y %H:%M:%S')"
}

check_directory() {
  if [[ ! -d $1 ]]; then
    echo "Directory does not exist!"
    exit 1
  fi
}

main() {
  if [[ -f "$recorder_flag" ]]; then
    stop_recording
    exit 0
  fi

  # check dependencies
  check_deps slop
  check_deps ffcast
  check_deps ffmpeg
  check_deps xclip
  check_deps rofi

  # rebind long args as short ones
  for arg in "$@"; do
    shift
    case "$arg" in
      '--help') set -- "$@" '-h' ;;
      '--directory') set -- "$@" '-d' ;;
      '--timestamp') set -- "$@" '-t' ;;
      '--stop') set -- "$@" '-s' ;;
      *) set -- "$@" "$arg" ;;
    esac
  done

  # parse short options
  OPTIND=1
  date_format="$default_date_format"
  while getopts "hd:t:s" opt; do
    case "$opt" in
      'h')
        show_help
        exit 0
        ;;
      'd')
        check_directory $OPTARG
        dir="$OPTARG"
        ;;
      't')
        date_format="$OPTARG"
        ;;
      's')
        stop_recording
        exit 0
        ;;
      '?')
        show_help
        exit 1
        ;;
    esac
  done
  shift $(expr $OPTIND - 1)


  # Get choice from rofi
  choice=$( (get_options) | rofi -dmenu -i -fuzzy -p "Screenshot")

  # If user has not picked anything, exit
  if [[ -z "${choice// /}" ]]; then
    exit 1
  fi

  mkdir -p $dir
  cmd='date "${date_format}"'
  dt=$(eval $cmd)
  echo $dt

  # run the selected command
  case $choice in
    '     Screenshot')
      screenshot_region_copysave "$dt"
      ;;
    '     Gif')
      record_region_gif "$dt"
      ;;
    '     MP4')
      record_region_mp4 "$dt"
      ;;
    '     Stop recording')
      stop_recording
      ;;
  esac

  # done
  set -e
}

main "$@" &

exit 0

! /bin/bash
