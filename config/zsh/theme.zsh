#!/usr/bin/env zsh

autoload -U colors && colors

#
# base16 shell base configuration
#
BASE16_SHELL=$HOME/.config/base16-shell/
BASE16_SHELL_HOOKS=$HOME/.config/base16-hooks

[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

