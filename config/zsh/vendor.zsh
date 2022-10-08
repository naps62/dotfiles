#!/usr/bin/env zsh

#
# antidote plugins
#
source  $HOME/.antidote/antidote.zsh
antidote load ~/.config/zsh/antidote.plugins.txt

# zsh-history-substring-search
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

#
# fzf
#
[ -f /usr/share/doc/fzf/examples/key-bindings.zsh ] && source /usr/share/doc/fzf/examples/key-bindings.zsh
[ -f /usr/share/doc/fzf/examples/completion.zsh ] && source /usr/share/doc/fzf/examples/completion.zsh
export FZF_DEFAULT_COMMAND="rg --files --hidden --follow --ignore-file $HOME/.config/ripgrep/ignore"

#
# asdf
#
[ -f $HOME/.asdf/asdf.sh ] && source $HOME/.asdf/asdf.sh

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
# zellij
#
[[ -z $NVIM ]] && eval "$(zellij setup --generate-auto-start zsh)"

#
# misc
#
# broot: directory tree viewer
source /home/naps62/.config/broot/launcher/bash/br
