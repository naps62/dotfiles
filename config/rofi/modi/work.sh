#!/bin/sh

find='fd ".git$" --prune -u -t d -E ".cache" -E ".asdf" -E ".cargo" -E ".local" -E ".go" -x echo {//}'

list() {
  for p in $(eval $find); do
    name=${p%/.git}
    name=${name#$HOME/}
    echo $name
  done

}

run () {
  for p in $(eval $find); do
    project_path=${p%/.git}
    name=${project_path#$HOME/}

    if [[ "$1" == "$name" ]]; then
      $HOME/.bin/work $project_path > /dev/null
    fi
  done
}

run_project () {
  name=$1
  path=$2

  cd $path
  hyprctl dispatch exec alacritty
}

if [ -z "$1" ]; then
  list
else
  run $1
fi
