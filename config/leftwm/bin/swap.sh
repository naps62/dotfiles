#!/bin/sh -ue

mode=$1

state=$(leftwm-state --quit)
w0=$(echo $state | jq '.workspaces[] | select(.index == 0) | .tags[] | select(.mine == true) | .index')
w1=$(echo $state | jq '.workspaces[] | select(.index == 1) | .tags[] | select(.mine == true) | .index')
w2=$(echo $state | jq '.workspaces[] | select(.index == 2) | .tags[] | select(.mine == true) | .index')

dir=$HOME/.config/leftwm/state

sum=$(($w0 + $w1 + $w2))

echo -e "$w0\n$w1\n$w2" > $dir/current.state

if [[ ! -f $dir/work.state ]]; then
  echo -e "0\n1\n2" > $dir/work.state
fi

if [[ ! -f $dir/chat.state ]]; then
  echo -e "3\n4\n5" > $dir/chat.state
fi

function apply_state() {
  file=$1
  i=0
  while read -r line; do
    leftwm-command "SendWorkspaceToTag $i $line"
    i=$(($i + 1))
  done < $file
}

case $mode in
  work)
    apply_state "$dir/work.state"
    ln -sf $dir/work.state $dir/current.state
    ;;
  chat)
    apply_state "$dir/chat.state"
    ln -sf $dir/chat.state $dir/current.state
    ;;
  swap)
    if readlink "$dir/current.state" | grep "work.state" > /dev/null; then
      # got to chat
      apply_state "$dir/chat.state"
      ln -sf $dir/chat.state $dir/current.state
    else
      # got to work
      apply_state "$dir/work.state"
      ln -sf $dir/work.state $dir/current.state
    fi
    ;;
esac
