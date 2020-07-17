#!/usr/bin/env zsh

#
# erlang
#
[ -f ~/.config/erlang/erl.init ] && source ~/.config/erlang/erl.init

#
# fzf
#
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f ~/.fzf.colors ] && source ~/.fzf.colors
export FZF_DEFAULT_COMMAND="rg --files --hidden --follow --ignore-file $HOME/.config/ripgrep/ignore"

#
# asdf
#
[ -f $HOME/.asdf/asdf.sh ] && source $HOME/.asdf/asdf.sh

#
# direnv
#
eval "$(direnv hook zsh)"
