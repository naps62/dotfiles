#!/bin/sh

env_dir() {
  local var=$1
  local val=$2
  eval old=\$$var
  export $var=$val:$old
}

# path
env_dir PATH $HOME/.bin
env_dir PATH $HOME/.local/bin
env_dir PATH $HOME/.cargo/bin
env_dir PATH $HOME/.go/bin
env_dir PATH $HOME/.foundry/bin
env_dir PATH $HOME/.local/share/solana/install/active_release/bin
env_dir PATH ./.git/safe/../../node_modules/.bin
env_dir PATH ./.git/safe/../../bin
env_dir PATH "../.git/safe/../../node_modules/.bin"
env_dir PATH "../../.git/safe/../../.bin"
env_dir PATH $HOME/projects/zk/bin

env_dir LD_LIBRARY_PATH /usr/local/lib

export LANG=en_US.utf-8
export EDITOR=nvim
export BROWSER=/usr/bin/firefox
export TERMINAL=/usr/bin/alacritty
export ZK_PATH=$HOME/projects/zettelkasten
export GOPATH=$HOME/.go

# solana

# move lang vars
export DOTNET_ROOT="/home/naps62/.dotnet"
export PATH="/home/naps62/.dotnet/tools:$PATH"
export Z3_EXE="/home/naps62/bin/z3"
export CVC5_EXE="/home/naps62/bin/cvc5"
export BOOGIE_EXE="/home/naps62/.dotnet/tools/boogie"


if [ -z "$TMUX" ]; then
  export TERM=xterm-256color
else
  export TERM=screen-256color
fi

[ -f ~/.secrets.zsh ] && source ~/.secrets.zsh
