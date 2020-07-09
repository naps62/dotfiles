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
export FZF_DEFAULT_OPTS="--height=40% --multi --tiebreak=begin \
  --bind 'ctrl-y:execute-silent(echo {} | copy)' \
  --bind 'alt-down:preview-down,alt-up:preview-up' \
  --bind \"ctrl-v:execute-silent[ \
    tmux send-keys -t \{left\} Escape :vs Space && \
    tmux send-keys -t \{left\} -l {} && \
    tmux send-keys -t \{left\} Enter \
  ]\"
  --bind \"ctrl-x:execute-silent[ \
    tmux send-keys -t \{left\} Escape :sp Space && \
    tmux send-keys -t \{left\} -l {} && \
    tmux send-keys -t \{left\} Enter \
  ]\"
  --bind \"ctrl-o:execute-silent[ \
    tmux send-keys -t \{left\} Escape :read Space ! Space echo Space && \
    tmux send-keys -t \{left\} -l \\\"{}\\\" && \
    tmux send-keys -t \{left\} Enter \
  ]\""

#
# asdf
#
[ -f $HOME/.asdf/asdf.sh ] && source $HOME/.asdf/asdf.sh

#
# direnv
#
eval "$(direnv hook zsh)"
