#!/usr/bin/env zsh

function zsh_reload {
  [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
  source ~/.zsh/defaults
  source ~/.zsh/env
  source ~/.zsh/cmds

  # interactive-only stuff
  [[ $- == *i* ]] || return
  source ~/.zsh/completions
  source ~/.zsh/aliases
  source ~/.zsh/history
  source ~/.zsh/prompt
}

zsh_reload
