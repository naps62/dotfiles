#!/usr/bin/env zsh

# add custom completion path
fpath=(~/.config/zsh/completions.d $fpath)
fpath=(${ASDF_DIR}/completions $fpath)

autoload -Uz compinit

if [ $UID ]; then
  # We are root (probably in sudo mode?), do not check for insecure directories
  # since this check was done for your regular user, and since some files in
  # fpath do not belong to root but to your regular user
  compinit -u
else
  compinit
fi

zstyle ':completion:*' menu select=2
zstyle ':completion:*:*:git:*' user-commands ${${(M)${(k)commands}:#git-*}/git-/}
