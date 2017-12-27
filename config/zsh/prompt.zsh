# #!/usr/bin/env zsh

setopt prompt_subst

ZSH_THEME_GIT_PROMPT_PREFIX="${fg[blue]}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_NOCACHE=1

blue="%{%B%F{blue}%}"
green="%{%B%F{green}%}"
red="%{%B%F{red}%}"
yellow="%{%B%F{yellow}%}"
reset="%{$reset_color%}"

root_warning () {
  [[ "$USERNAME" ==  "root" ]] && echo "${red}☢  "
}

remote_warning () {
  [[ -z "$SSH_CLIENT" ]] || echo "${yellow}SSH:`hostname` "
}

prompt_char () {
  echo -n "%(?.${green}.${red})"

  # if we are root, prompt is a #
  [[ "$USERNAME" == "root" ]] && echo '#' && return

  # if we are in a git repo, prompt is ±
  command git rev-parse --git-dir >/dev/null 2>/dev/null && echo '±' && return

  # otherwise, a good-ol $
  echo '$'
}

git_review_status () {
  return
  # if we are in a git repo, prompt is ±
  # command git rev-parse --git-dir >/dev/null 2>/dev/null return

  # cache_file="$PWD/.git/review-status-cache"
  # cache_age=`stat -L -f %Y $cache_file`

  # echo -n " "

  # if $(( (`date +%s` - $cache_age ) > (10*60) )); then
  #   git review-status > $cache_file
  # fi

  # cat $PWD/.git/review-status-cache
}

git_path () {
  repo_path=$(git rev-parse --show-toplevel)
  repo_name=${repo_path##*/}

  path_in_repo=${PWD#$repo_path}
  path_in_repo=${path_in_repo#/}
  full="$green$repo_name"$blue' '$path_in_repo

  echo ${full%% }
}

not_git_path () {
  echo "%~"
}

path () {
  # echo "asd"
  ((git rev-parse 2>/dev/null >/dev/null) && git_path) || not_git_path
}

export GIT_RADAR_COLOR_BRANCH="%{%B$fg[yellow]%}"
export GIT_RADAR_FORMAT=" \x01\033[1;30m\x02\x01\033[0m\x02%{remote: }%{branch}%{ :local}\x01\033[1;30m\x02\x01\033[0m\x02%{ :changes}"

PROMPT=$'\n'
PROMPT=${PROMPT}'`root_warning``remote_warning`${blue}`path`'
PROMPT=${PROMPT}'$(~/.config/git-radar/git-radar --zsh --fetch)'
PROMPT=${PROMPT}'`git_review_status`'$'\n'
PROMPT=${PROMPT}'${green}`prompt_char`${reset} '

# TODO time spent on last command
preexec() {
  typeset -ig _start=SECONDS
}

precmd() {
  set -A _elapsed $(( SECONDS-_start ))
}
RPROMPT=""
RPROMPT=${RPROMPT}'%{%B$fg[grey]%}`printf %.2g $((${_elapsed[-1]}))`s'
RPROMPT=${RPROMPT}' | '
RPROMPT=${RPROMPT}'%T'
