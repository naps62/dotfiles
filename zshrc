#!/usr/bin/env zsh

function zsh_reload {
  source ~/.shell_files/zsh/defaults
  source ~/.shell_files/zsh/completions
  source ~/.shell_files/env
  source ~/.shell_files/cmds
  source ~/.zsh_aliases
  eval "$(hub alias -s)"
  source ~/.shell_files/zsh/history

  # interactive-only stuff
  [[ $- == *i* ]] || return
  source ~/.shell_files/zsh/prompt
}

zsh_reload

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
eval "$(direnv hook zsh)"

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

ttyctl -f

[[ $- != *i* ]] && return
[[ -z "$TMUX" ]] && exec tmux
