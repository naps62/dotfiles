#!/usr/bin/env zsh

source ~/.config/zsh/env.zsh
source ~/.config/zsh/cmds.zsh
source ~/.config/zsh/aliases.zsh
source ~/.config/zsh/completions.zsh
source ~/.config/zsh/history.zsh
source ~/.config/zsh/vendor.zsh
source ~/.config/zsh/rpc.sh

source /home/naps62/.config/broot/launcher/bash/br

# bun completions
[ -s "/home/naps62/.bun/_bun" ] && source "/home/naps62/.bun/_bun"
