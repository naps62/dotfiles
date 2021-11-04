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

#
# light/dark mode settings
#
export DARK_MODE=0

typeset -gA ZSH_HIGHLIGHT_STYLES

if [[ $DARK_MODE == 1 ]]; then
  ZSH_HIGHLIGHT_STYLES[suffix-alias]=fg=green,underline
  ZSH_HIGHLIGHT_STYLES[precommand]=fg=green,underline
  ZSH_HIGHLIGHT_STYLES[arg0]=fg=green,bold

  export STARSHIP_CONFIG=~/.config/starship/starship-dark.toml
else
  ZSH_HIGHLIGHT_STYLES[suffix-alias]=fg=blue,underline
  ZSH_HIGHLIGHT_STYLES[precommand]=fg=blue,underline
  ZSH_HIGHLIGHT_STYLES[arg0]=fg=blue,bold

  export STARSHIP_CONFIG=~/.config/starship/starship-light.toml
fi

