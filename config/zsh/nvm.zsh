#!/bin/sh

declare -a NODE_GLOBALS=(`find ~/.nvm/versions/node -maxdepth 3 -type l -wholename '*/bin/*' | xargs -n1 basename | sort | uniq`)

NODE_GLOBALS+=("node")
NODE_GLOBALS+=("nvm")

load_nvm () {
  export NVM_DIR=~/.nvm
  [ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"
}

export PATH=$HOME/.nvm/versions/node/v7.4.0/bin:$PATH
