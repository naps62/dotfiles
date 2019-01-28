#!/bin/sh

stty -ixon

setopt auto_cd
cdpath=($HOME/subvisual $HOME/consulting $HOME/downloads)

. $HOME/.asdf/asdf.sh
