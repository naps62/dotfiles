#!/bin/sh

env_dir() {
  local var=$1
  local val=$2
  eval old=\$$var
  export $var=$val:$old
}

export JAVA_HOME=/usr/lib/jvm/java-17-openjdk

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
env_dir PATH $JAVA_HOME/bin

env_dir LD_LIBRARY_PATH /usr/local/lib

export LANG=en_US.utf-8
export EDITOR=nvim
export BROWSER=/usr/bin/google-chrome-stable
export TERMINAL=/usr/bin/alacritty
export ZK_PATH=$HOME/projects/zettelkasten
export GOPATH=$HOME/.go

# sway-nvidia
if [[ $(hostname) == "konishi" ]]; then
  export WLR_RENDERER=vulkan
  export XWAYLAND_NO_GLAMOR=1
  export WLR_NO_HARDWARE_CURSORS=1
fi

if [ -z "$TMUX" ]; then
  export TERM=xterm-256color
else
  export TERM=screen-256color
fi

# latte
# export FZF_DEFAULT_OPTS=" \
# --color=bg+:#ccd0da,bg:#eff1f5,spinner:#dc8a78,hl:#d20f39 \
# --color=fg:#4c4f69,header:#d20f39,info:#8839ef,pointer:#dc8a78 \
# --color=marker:#dc8a78,fg+:#4c4f69,prompt:#8839ef,hl+:#d20f39"

# mocha
export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"

[ -f $HOME/.secrets.zsh ] && source $HOME/.secrets.zsh

stty -ixon

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
