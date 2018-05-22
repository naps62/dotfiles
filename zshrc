#!/usr/bin/env zsh

source ~/.config/zsh/env.sh
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
source ~/.config/zsh/vendor.zsh
[ -f ~/.fzf.colors ] && source ~/.fzf.colors

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
