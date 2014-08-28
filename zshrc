#!/usr/bin/env zsh

function zsh_reload {
  # aliases

  source ~/.shell_files/defaults
  source ~/.shell_files/completions
  source ~/.shell_files/env
  source ~/.shell_files/cmds
  [[ -f ~/.aliases ]] && source ~/.aliases
  source ~/.zsh_aliases
  source ~/.shell_files/history

  # interactive-only stuff
  [[ $- == *i* ]] || return
  source ~/.shell_files/prompt
}

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

zsh_reload

env_dir PATH $HOME/.rvm/bin # Add RVM to PATH for scripting
env_dir PATH ./.git/safe/../../bin

export CASPER_DEV_DB_USERNAME=''
export CASPER_DEV_DB_PASSWORD=''
export API_KEY=6b112c164f7ef87081982e938ff4eb85
