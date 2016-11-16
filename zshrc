#!/usr/bin/env zsh

source $HOME/.zsh/rvm
source $HOME/.nvm/nvm.sh
source $HOME/.zsh/env
source $HOME/.zsh/bindings
source $HOME/.zsh/cmds
source $HOME/.zsh/theme

$HOME/.bin/ensure-tmux-is-running

source $HOME/.zsh/completions
source $HOME/.zsh/aliases
source $HOME/.zsh/history
source $HOME/.zsh/prompt

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
