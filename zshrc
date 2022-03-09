#!/usr/bin/env zsh

source ~/.config/zsh/env.sh

if [[ -z $VIM ]]; then
  source ~/.config/zsh/env.zsh
  source ~/.config/zsh/bindings.zsh
  source ~/.config/zsh/cmds.zsh
  source ~/.config/zsh/theme.zsh
fi

~/.bin/ensure-tmux-is-running

source ~/.config/zsh/aliases.zsh

if [[ -z $VIM ]]; then
  source ~/.config/zsh/completions.zsh
  source ~/.config/zsh/history.zsh
  source ~/.config/zsh/antibody.zsh
  source ~/.config/zsh/vendor.zsh

  eval "$(starship init zsh)"
fi
[ -f ~/.fzf.colors ] && source ~/.fzf.colors

if [ -e /home/naps62/.nix-profile/etc/profile.d/nix.sh ]; then . /home/naps62/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

