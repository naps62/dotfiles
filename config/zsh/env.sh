#!/bin/sh

env_dir() {
  local var=$1
  local val=$2
  eval old=\$$var
  export $var=$val:$old
}

# path
env_dir PATH /usr/local/opt/
env_dir PATH /opt/cuda/bin/
env_dir PATH /opt/depot_tools
env_dir PATH $HOME/.bin
env_dir PATH $HOME/.appimages
env_dir PATH $HOME/.cabal/bin
env_dir PATH $HOME/.local/bin
env_dir PATH /Applications/Postgres.app/Contents/Versions/latest/bin
env_dir PATH $HOME/.cargo/bin
env_dir PATH $HOME/.go/bin
env_dir PATH ./.git/safe/../../node_modules/.bin
env_dir PATH ./.git/safe/../../bin
env_dir PATH ./.git/safe/../../assets/node_modules/.bin
env_dir PATH $HOME/utrust/cli/bin
env_dir PATH $HOME/coverflex/cli/bin
env_dir PATH $HOME/projects/zk/bin

env_dir LD_LIBRARY_PATH /usr/local/lib

[[ `uname -s` == "Darwin" ]] && export IS_MAC_OS=1
export GOPATH=$HOME/.go
export XDG_CONFIG_HOME=$HOME/.config
export LANG=en_US.utf-8
export LC_CTYPE=en_US.utf-8
export LC_ALL=en_US.UTF-8
export EDITOR=nvim
export BROWSER=/usr/bin/firefox
export TERMINAL=uxterm
export SSL_CERT_FILE=/etc/ssl/certs/ca-certificates.crt
export YAOURT_COLORS="nb=1:pkg=1:ver=1;32:lver=1;45:installed=1;42:grp=1;34:od=1;41;5:votes=1;34:dsc=0:other=1;35"
export NVM_DIR=/home/naps62/.nvm
export NVIM_LISTEN_ADDRESS=/tmp/nvimsocket
export ANDROID_SKD=/home/naps62/.config/Android/Sdk
export ANDROID_HOME=/home/naps62/.config/Android/Sdk
export ANDROID_SDK_ROOT=/home/naps62/.config/Android/Sdk
export JAVA_HOME=/usr/lib/jvm/default
export TESSDATA_PREFIX=/usr/share/tessdata
export ZK_PATH=$HOME/projects/zettelkasten
export FrameworkPathOverride=/usr/lib/mono/4.7.1-api


if [ -z "$TMUX" ]; then
  export TERM=xterm-256color
else
  export TERM=screen-256color
fi

export downloads=/home/naps62/downloads
export THEME=dark
export LIVE_CODING=0
export TALK_TITLE=""

[ -f ~/.secrets.zsh ] && source ~/.secrets.zsh

export LS_COLORS='rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.lz=01;31:*.xz=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.axv=01;35:*.anx=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.axa=00;36:*.oga=00;36:*.spx=00;36:*.xspf=00;36:';

# TODO this is a hack
# xmodmap is meant to be ran only once
# it also requires that I'm not pressing any meta keys while running
#
# this happens to work because I launch a terminal right on boot, so it has enough time to run before I start working
#
if [ ! -f /tmp/xmodmap-ran ]; then
	xmodmap ~/.Xmodmap
  touch /tmp/xmodmap-ran
fi

# if [[ -z $VIM ]] && [[ -z $VIMRUNTIME ]]; then
#   export NAPS62_INSIDE_VIM=1
# else

