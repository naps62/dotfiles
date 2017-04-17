#!/bin/sh

env_dir() {
  local var=$1
  local val=$2
  eval old=\$$var
  export $var=$val:$old
}

# path
env_dir PATH $HOME/.bin
env_dir PATH $HOME/.cabal/bin
env_dir PATH $HOME/.local/bin
env_dir PATH $HOME/.xmonad/bin
env_dir PATH $HOME/.linuxbrew/bin
# env_dir PATH $HOME/.rvm/bin # Add RVM to PATH for scripting
env_dir PATH $HOME/.rbenv/bin
env_dir PATH $HOME/.rbenv/plugins/ruby-build/bin
env_dir PATH $HOME/.cargo/bin
env_dir PATH ./.git/safe/../../node_modules/.bin
env_dir PATH ./.git/safe/../../bin

env_dir LD_LIBRARY_PATH /usr/local/lib

export XDG_CONFIG_HOME=$HOME/.config
export LANG=en_US.utf-8
export LC_CTYPE=en_US.utf-8
export LC_ALL=en_US.UTF-8
export EDITOR=nvim
export TERMINAL=uxterm
export METRIC_FU_OUT=$HOME/data/metric_fu
export SSL_CERT_FILE=/etc/ssl/certs/ca-certificates.crt
export YAOURT_COLORS="nb=1:pkg=1:ver=1;32:lver=1;45:installed=1;42:grp=1;34:od=1;41;5:votes=1;34:dsc=0:other=1;35"
export ES_HOME=/usr/share/elasticsearch
export NVM_DIR=/home/naps62/.nvm
export NVIM_LISTEN_ADDRESS=/tmp/nvimsocket

export FZF_DEFAULT_COMMAND="rg --files --hidden --follow --ignore-file $HOME/.config/ripgrep/ignore"

if [ -z "$TMUX" ]; then
  export TERM=xterm-256color
else
  export TERM=screen-256color
fi

stty -ixon

setopt auto_cd
cdpath=($HOME/subvisual $HOME/consulting $HOME/downloads)

export downloads=/home/naps62/downloads
export THEME=dark
export LIVE_CODING=0
export TALK_TITLE="Braga JS"
