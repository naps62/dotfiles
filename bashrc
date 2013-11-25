#!/usr/bin/env bash

function bash_reload {
  source ~/.shell_files/files/shell/env
  source ~/.shell_files/files/shell/cmds
  source ~/.shell_files/files/shell/bash/aliases
  source ~/.shell_files/files/shell/bash/defaults
  source ~/.shell_files/files/shell/bash/history

  # interactive-only stuff
  [[ $- == *i* ]] || return
  source ~/.shell_files/files/shell/bash/colors
  source ~/.shell_files/files/shell/bash/ps1
}

#bash_reload

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
