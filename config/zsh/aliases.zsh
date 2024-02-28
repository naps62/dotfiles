#!/usr/bin/env sh

alias open='xdg-open'

# one-char aliases
alias c=cargo
alias d=docker
alias dc=docker-compose
alias g=git
alias o=open
alias v=nvim
alias vim=nvim
alias h=helix
alias n=nvim
alias x=extract
alias j=just

# rust replacements
# https://zaiste.net/posts/shell-commands-rust
alias ls=eza
alias cat=bat
alias ps=procs

alias pass="PASSWORD_STORE_DIR=~/sync/pass pass"

# cd
alias ..='cd ..'
alias ..2='cd ../..'
alias ..3='cd ../../..'

alias goerli="docker-compose --project-name goerli"
alias mainnet="docker-compose --project-name mainnet"
