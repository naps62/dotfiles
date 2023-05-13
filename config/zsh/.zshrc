#!/usr/bin/env zsh

source ~/.config/zsh/env.zsh
source ~/.config/zsh/cmds.zsh
source ~/.config/zsh/aliases.zsh
source ~/.config/zsh/completions.zsh
source ~/.config/zsh/history.zsh
source ~/.config/zsh/vendor.zsh
source ~/.config/zsh/rpc.sh

export PATH="$PATH:/home/naps62/.helios/bin"

source /home/naps62/.config/broot/launcher/bash/br

[ -s "/home/naps62/.svm/svm.sh" ] && source "/home/naps62/.svm/svm.sh"

# pnpm
export PNPM_HOME="/home/naps62/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end