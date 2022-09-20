#!/usr/bin/env zsh

source ~/.config/zsh/env.sh
source ~/.config/zsh/env.zsh
source ~/.config/zsh/bindings.zsh
source ~/.config/zsh/cmds.zsh
source ~/.config/zsh/theme.zsh
source ~/.config/zsh/aliases.zsh
source ~/.config/zsh/completions.zsh
source ~/.config/zsh/history.zsh
source ~/.config/zsh/antibody.zsh
source ~/.config/zsh/vendor.zsh

eval "$(starship init zsh)"
#eval "$(zoxide init zsh --cmd cd)"

source /home/naps62/.config/broot/launcher/bash/br
