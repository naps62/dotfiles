#!/usr/bin/env sh

alias open='xdg-open'

# one-char aliases
alias c=cargo
alias d=docker
alias dc=docker-compose
alias g=git
alias o=open
alias n="nvim"
alias v="anvim"
alias gv="neovide --multigrid"
alias n=nvim
alias x=extract
alias y=yay
alias j=just

# rust replacements
# https://zaiste.net/posts/shell-commands-rust
alias ls=exa
alias cat=bat
alias ps=procs

alias vim=nvim

alias pass="PASSWORD_STORE_DIR=~/sync/pass pass"

# cd
alias ..='cd ..'
alias ..2='cd ../..'
alias ..3='cd ../../..'

alias goerli="docker-compose --project-name goerli"
alias mainnet="docker-compose --project-name mainnet"
