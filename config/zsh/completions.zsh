#!/usr/bin/env zsh

# add custom completion path
fpath=(${ASDF_DIR}/completions $fpath)

autoload -Uz compinit

if [ $UID ]; then
  # We are root (probably in sudo mode?), do not check for insecure directories
  # since this check was done for your regular user, and since some files in
  # fpath do not belong to root but to your regular user
  compinit -u
else
  compinit -C
fi

zstyle ':completion:*' menu select=2
zstyle ':completion:*:*:git:*' user-commands ${${(M)${(k)commands}:#git-*}/git-/}

# Tab completion from both ends
setopt completeinword

# Case-insensitive tab completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z-_}={A-Za-z_-}' 'r:|=*' 'l:|=* r:|=*'

setopt nocasematch

# pasting with tabs doesn't perform completion
zstyle ':completion:*' insert-tab pending

# Use menu selection instead of tab cycle
zstyle ':completion:*:*:*:*:*' menu select

# list-colors when completing
zstyle ':completion:*' list-colors "${(@s.:.)LS_COLORS}"
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'
