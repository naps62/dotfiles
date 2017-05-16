#!/bin/sh

DEFAULT_NODE_VERSION=7.4.0
DEFAULT_NODE_PATH=$HOME/.nvm/versions/node/v${DEFAULT_NODE_VERSION}/bin

export PATH=${DEFAULT_NODE_PATH}:${PATH}

load_nvm () {
  export NVM_DIR=~/.nvm
  [ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"
}
