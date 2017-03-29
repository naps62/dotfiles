#!/usr/bin/env zsh

~/.bin/ensure-xorg-is-running

source ~/.config/zsh/rvm.zsh
source ~/.nvm/nvm.sh
source ~/.config/zsh/env.zsh
source ~/.config/zsh/bindings.zsh
source ~/.config/zsh/cmds.zsh
source ~/.config/zsh/theme.zsh

~/.bin/ensure-tmux-is-running

source ~/.config/zsh/completions.zsh
source ~/.config/zsh/aliases.zsh
source ~/.config/zsh/hashes.zsh
source ~/.config/zsh/history.zsh
source ~/.config/zsh/prompt.zsh
source ~/.config/zsh/antibody.zsh

[ -f ~/.secrets.zsh ] && source ~/.secrets.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
