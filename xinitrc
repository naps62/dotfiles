# [[ -f $HOME/.Xresources ]] && xrdb -merge $HOME/.Xresources

# # setxkbmap -option caps:none
# xset r rate 160 40

# xrdb -merge $HOME/.Xresources
# xmodmap $HOME/.Xmodmap

# start session
DEFAULTSESSION=leftwm
#case "$1" in
#  awesome) exec awesome ;;
#  gnome-session)  exec gnome-session ;;
#  i3) xmodmap ~/.Xmodmap && exec i3;;
#  *) xmodmap ~/.Xmodmap && exec $DEFAULTSESSION ;;
#esac
