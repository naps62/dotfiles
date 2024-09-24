#!/bin/sh

env_dir() {
  local var=$1
  local val=$2
  eval old=\$$var
  export $var=$val:$old
}

export JAVA_HOME=/usr/lib/jvm/java-17-openjdk
export BUN_INSTALL="$HOME/.bun"

# path
env_dir PATH $HOME/.bin
env_dir PATH $HOME/.local/bin
env_dir PATH $HOME/.cargo/bin
env_dir PATH $HOME/.go/bin
env_dir PATH $HOME/.config/.foundry/bin
env_dir PATH $HOME/.local/share/solana/install/active_release/bin
env_dir PATH ./.git/safe/../../node_modules/.bin
env_dir PATH ./.git/safe/../../bin
env_dir PATH "../.git/safe/../../node_modules/.bin"
env_dir PATH "../../.git/safe/../../.bin"
env_dir PATH $HOME/projects/zk/bin
env_dir PATH $JAVA_HOME/bin
env_dir PATH $BUN_INSTALL/bin
env_dir PATH $HOME/.cyfrin/bin

env_dir LD_LIBRARY_PATH /usr/local/lib

export ANDROID_HOME=$HOME/.android/sdk
export NDK_HOME=$ANDROID_HOME/ndk/26.1.10909125
export LANG=en_US.utf-8
export EDITOR=nvim
export BROWSER=/usr/bin/google-chrome-stable
export ZK_PATH=$HOME/projects/zettelkasten

# sway-nvidia
if [[ $(hostname) == "konishi" ]]; then
  export XWAYLAND_NO_GLAMOR=1
  export WLR_NO_HARDWARE_CURSORS=1
fi

if [ -z "$TMUX" ]; then
  export TERM=xterm-256color
else
  export TERM=screen-256color
fi

[ -f $HOME/.secrets.zsh ] && source $HOME/.secrets.zsh

# stty -ixon
