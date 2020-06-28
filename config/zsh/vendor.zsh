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

#
# asdf
#
[ -f ~/.asdf/asdf.sh ] && source ~/.asdf/asdf.sh

#
# direnv
#
eval "$(direnv hook zsh)"
