#!/bin/sh -ue

target=$1
bin=$HOMe/.config/leftwm/bin
state=$HOME/.config/leftwm/state

if ! cat $state/current.state | grep $target; then
  $bin/swap.sh swap
fi

function is_tag_in_workspace() {
  w=$(echo $state | jq ".workspaces[] | select(.index == $1) | .tags[] | select(.mine == true) | .index")

  [[ $w == $2 ]] && echo "1"
}

function current_tag() {
  leftwm-state --quit | jq '.workspaces[] | select(.tags[] | .focused == true and .mine == true) | .index'
}

while [[ ! $done ]]; do
done

if is_tag_in_workspace $target 0; then
  leftwm-command


