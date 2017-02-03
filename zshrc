#!/usr/bin/env zsh

source $HOME/.config/zsh/rvm.zsh
source $HOME/.nvm/nvm.sh
source $HOME/.config/zsh/env.zsh
source $HOME/.config/zsh/bindings.zsh
source $HOME/.config/zsh/cmds.zsh
source $HOME/.config/zsh/theme.zsh

$HOME/.bin/ensure-tmux-is-running

source $HOME/.config/zsh/completions.zsh
source $HOME/.config/zsh/aliases.zsh
source $HOME/.config/zsh/history.zsh
source $HOME/.config/zsh/prompt.zsh
source $HOME/.config/zsh/antibody.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
