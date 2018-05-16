#!/usr/bin/env zsh

autoload -U colors && colors

export BASE16_SHELL=$HOME/.base16-manager/chriskempson/base16-shell/

# TODO this is a hack
# base16-manager is not suposed to be required to be called on every run
# but for some reason I can't get it to work on ~/.xsession
if [ ! -f /tmp/base16-theme-ran ]; then
  base16-manager set eighties
  touch /tmp/base16-theme-ran
fi
