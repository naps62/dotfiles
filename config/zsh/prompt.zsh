# #!/usr/bin/env zsh

setopt prompt_subst

ZSH_THEME_GIT_PROMPT_PREFIX="${fg[blue]}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_NOCACHE=1

blue="%{%B%F{blue}%}"
green="%{%B%F{green}%}"
red="%{%B%F{red}%}"
reset="%{$reset_color%}"

prompt_char () {
  echo -n "%(?.${green}.${red})"
  command git rev-parse --git-dir >/dev/null 2>/dev/null && echo '±' && return
  [ $USERNAME != "root" ] && echo '$' || echo '#'
}

git_path () {
  repo_path=$(git rev-parse --show-toplevel)
  repo_name=${repo_path##*/}

  path_in_repo=${PWD#$repo_path}
  path_in_repo=${path_in_repo#/}
  echo "$green$repo_name"' '$blue$path_in_repo
}

not_git_path () {
  echo "%~"
}

path () {
  ((git rev-parse 2>/dev/null >/dev/null) && git_path) || not_git_path
}

export GIT_RADAR_COLOR_BRANCH="%{%B$fg[yellow]%}"
export GIT_RADAR_FORMAT=" \x01\033[1;30m\x02\x01\033[0m\x02%{remote: }%{branch}%{ :local}\x01\033[1;30m\x02\x01\033[0m\x02%{ :changes}"

PROMPT=$'\n'
PROMPT=${PROMPT}'${blue}`path`'
PROMPT=${PROMPT}'$(~/.config/git-radar/git-radar --zsh --fetch)'$'\n'
PROMPT=${PROMPT}'${green}`prompt_char`${reset} '

# TODO time spent on last command
# preexec() {
#   typeset -ig _start=SECONDS
# }

# precmd() {
#   set -A _elapsed $(( SECONDS-_start ))
# }
# RPROMPT='%{%B$fg[yellow]%}`printf %.2g $((${_elapsed[-1]}))`s'
