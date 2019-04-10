#!/bin/sh

if [[ `whoami` != "root" ]]; then
  [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
fi

# # Use chruby integration https://github.com/rvm/rvm/issues/3376
# if [[ `whoami` != "root" ]]; then
  # export rvm_path="$HOME/.rvm"
  # source /usr/share/chruby/chruby.sh
  # source /usr/share/chruby/auto.sh
  # source $HOME/.rvm/scripts/extras/chruby.sh

  # # Load RVM into a shell session *as a function* only when needed
  # alias loadrvm='[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"'

  # # Add RVM to PATH for scripting
  # export PATH="$rvm_path/bin:$PATH"
# fi

export PATH=/usr/local/opt/openssl@1.1/bin:$PATH
export LDFLAGS="-L/usr/local/opt/openssl@1.1/li"
