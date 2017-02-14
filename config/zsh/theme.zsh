#!/usr/bin/env zsh

autoload -U colors && colors

if [[ $THEME == "dark" ]]; then
  BASE16_SHELL="$HOME/.config/base16-shell/scripts/base16-default-dark.sh"
else
  BASE16_SHELL="$HOME/.config/base16-shell/scripts/base16-default-light.sh"
fi

if [[ -s $BASE16_SHELL ]]; then
  source $BASE16_SHELL
else
  echo ".config/base16-shell theme not found"
fi