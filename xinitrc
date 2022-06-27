# see https://unix.stackexchange.com/a/295652/332452
source /etc/X11/xinit/xinitrc.d/50-systemd-user.sh

# see https://wiki.archlinux.org/title/GNOME/Keyring#xinitrc
# eval $(/usr/bin/gnome-keyring-daemon --start)
export SSH_AUTH_SOCK

# see https://github.com/NixOS/nixpkgs/issues/14966#issuecomment-520083836
mkdir -p "$HOME"/.local/share/keyrings

# [[ -f $HOME/.Xresources ]] && xrdb -merge $HOME/.Xresources

# # setxkbmap -option caps:none
# xset r rate 160 40

# xrdb -merge $HOME/.Xresources
# xmodmap $HOME/.Xmodmap

# start session
DEFAULTSESSION=i3
case "$1" in
  awesome) exec awesome ;;
  gnome-session)  exec gnome-session ;;
  i3) xmodmap ~/.Xmodmap && exec i3;;
  *) xmodmap ~/.Xmodmap && exec $DEFAULTSESSION ;;
esac
