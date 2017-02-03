#!/usr/bin/env zsh

setopt HIST_FIND_NO_DUPS  # Do not display a line previously found.
setopt EXTENDED_HISTORY   # Write the history file in the ":start:elapsed;command" format.<Paste>
setopt INC_APPEND_HISTORY # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY      # Share history between all sessions.
setopt HIST_REDUCE_BLANKS # Remove superfluous blanks before recording entry.
setopt HIST_IGNORE_SPACE  # Don't store commands that start with spaces

export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=10000000
export SAVEHIST=$HISTSIZE
