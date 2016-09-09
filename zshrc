#!/usr/bin/env zsh

zshrc_home=/home/naps62

~/.bin/ensure-tmux-is-running

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
source $zshrc_home/.zsh/defaults
source $zshrc_home/.nvm/nvm.sh
source $zshrc_home/.zsh/env
source $zshrc_home/.zsh/cmds
source $zshrc_home/.zsh/theme
source $zshrc_home/.zsh/completions
source $zshrc_home/.zsh/aliases
source $zshrc_home/.zsh/history
source $zshrc_home/.zsh/prompt

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
