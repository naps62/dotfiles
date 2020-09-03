#!/usr/bin/env sh

alias reboot='sudo reboot'
alias halt='sudo poweroff'

alias apt='sudo aptitude'
alias open='xdg-open'

# eval "$(hub alias -s)"

# one-char aliases
alias a=ag
alias b=bundle
alias m=mix
alias be='bundle exec'
alias bc='bundle console'
alias dc='docker-compose'
alias d=docker
alias g=hub
alias h=heroku
alias o=open
alias r=rails
alias v=nvim
alias va=vagrant
alias x=extract
alias y=yay
alias s=bin/server
alias u=utrust
alias c=coverflex
alias l=leetcode

# rust replacements
# https://zaiste.net/posts/shell-commands-rust
alias ls=exa
alias cat=bat
alias ps=procs

# thoughtbot/parity
alias prod=production
alias stag=staging
alias sand=sandbox
alias dev=development

function rk() { rake "$@" }
function g() { git "$@" }
function f () { "$@" | fzf }

alias tn='tmux new -s'
alias ta='tmux attach -t'
alias tl='tmux list-sessions'
alias ts='tmux switch -t'
alias td='tmux detach'
alias tk='tmux kill-session -t'
alias tt='tmux choose-tree'

alias ss="nohup spring start"
alias st="spring stop"

autoload -U zmv
alias mmv='noglob zmv -W'

# cd
#alias cd='cdls'
alias ..='cd ..'
alias ..2='cd ../..'
alias ..3='cd ../../..'

# alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# proxy
alias proxy='source ${NAPS62_CONFDIR}/home/bin/proxy'
# alias vim="stty stop '' -ixoff ; vim"
alias vim=nvim

alias mypass="PASSWORD_STORE_DIR=~/.password-store-personal pass"
alias utrustpass="PASSWORD_STORE_DIR=~/.password-store-utrust pass"
