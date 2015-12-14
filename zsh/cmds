#!/bin/sh

# cd ls
# enter dir and immediately show contents
cdls () {
  cd $*
  ls
  #echo '' # open line for clarity
}

# most used commands list
most () {
  history | awk '{
      cmd[$2]++; count++;
    }
    END {
      for (i in cmd) print cmd[i]/count*100 "%", i
    }' | sort -nr | head -n20 | column -c3 -s " " -t
}

# extract archive
extract () {
  if [ -f $1 ]; then
    case $1 in
      *.tar.bz2)   tar xvjf $1    ;;
      *.tar.gz)    tar xvzf $1    ;;
      *.tar.xz)    tar xvJf $1    ;;
      *.bz2)       bunzip2 $1     ;;
      *.rar)       unrar x $1     ;;
      *.gz)        gunzip $1      ;;
      *.tar)       tar xvf $1     ;;
      *.tbz2)      tar xvjf $1    ;;
      *.tgz)       tar xvzf $1    ;;
      *.zip)       unzip $1       ;;
      *.Z)         uncompress $1  ;;
      *.7z)        7z x $1        ;;
      *.xz)        unxz $1        ;;
      *.exe)       cabextract $1  ;;
      *.ace)       unace $1       ;;
      *.arj)       unarj $1       ;;
      *)           echo "'$1': unrecognized file compression" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# mkcd
# create a directory structure and jump to the bottom one
mkcd () {
  mkdir -p "$1" && cd "$1"
}

# mark
mark () {
  file=~/.markfile
  [ -f $file ] || touch $file
  if grep "^$1=" $file > /dev/null; then
    sed -i -e "s:$1\=.*$:$1\=${PWD}:g" $file
    echo "entry $1 changed"
  else
    echo "$1=$PWD" >> $file
    echo "entry $1 added"
  fi
}

# goto
goto () {
  file=~/.markfile
  if [ $# -eq 1 ]; then
    dest=$(grep "^$1=" $file | cut -d= -f2)
    cd $dest
  else
    echo "no mark specified"
  fi
}

fancy-ctrl-z () {
  if [[ $#BUFFER -eq 0 ]]; then
    BUFFER="fg"
    zle accept-line
  else
    zle push-input
    zle-clear-screen
  fi
}

zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z

custom-ls () {
  if [[ "$@" =~ "-l" ]]; then
    ls --color $@ | awk '{k=0;for(i=0;i<=8;i++)k+=((substr($1,i+2,1)~/[rwx]/)*2^(8-i));if(k)printf(" %o ",k);print}'
  else
    command ls --color $@
  fi
}
