#!/usr/bin/env zsh

source /home/naps62/.config/zsh/catppuccin_mocha-zsh-syntax-highlighting.zsh

#
# antidote plugins
#
# source  /usr/share/zsh-antidote/antidote.zsh
# antidote load ~/.config/zsh/antidote.plugins.txt

# zsh-history-substring-search
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

#
# fzf
#
if [ -f /usr/share/fzf/key-bindings.zsh ]; then
  source /usr/share/fzf/key-bindings.zsh
  source /usr/share/fzf/completion.zsh
elif [ -f /usr/share/doc/fzf/examples/key-bindings.zsh ]; then
  source /usr/share/doc/fzf/examples/key-bindings.zsh
  source /usr/share/doc/fzf/examples/completion.zsh
fi
export FZF_DEFAULT_COMMAND="rg --files --hidden --follow --ignore-file $HOME/.config/ripgrep/ignore"

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

#
# atuin
#
eval "$(atuin init zsh)"


# bun
[ -s "/home/naps62/.bun/_bun" ] && source "/home/naps62/.bun/_bun"

# thefuck
eval $(thefuck --alias)
