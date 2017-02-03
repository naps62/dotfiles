#!/usr/bin/env zsh

# add custom completion path
fpath=(~/.config/zsh/completions.d $fpath)

autoload -U compinit
compinit

# zstyle ':completion:*' menu select=2
# zstyle ':completion:*:*:git:*' user-commands ${${(M)${(k)commands}:#git-*}/git-/}
