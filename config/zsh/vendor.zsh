#!/usr/bin/env zsh

source /home/naps62/.config/zsh/catppuccin_mocha-zsh-syntax-highlighting.zsh

#
# asdf
#
[ -f $HOME/.asdf/asdf.sh ] && source $HOME/.asdf/asdf.sh
[ -f /opt/asdf-vm/asdf.sh ] && source /opt/asdf-vm/asdf.sh

#
# direnv
#
eval "$(direnv hook zsh)"

#
# starship
#
autoload -U colors && colors
export STARSHIP_CONFIG=~/.config/starship/starship-dark.toml
eval "$(starship init zsh)"

#
# zoxide
#
eval "$(zoxide init zsh --cmd cd)"

#
# misc
#
# broot: directory tree viewer
source /home/naps62/.config/broot/launcher/bash/br


# bun
[ -s "/home/naps62/.bun/_bun" ] && source "/home/naps62/.bun/_bun"

# thefuck
eval $(thefuck --alias)
