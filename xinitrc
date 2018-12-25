[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
[[ -f ~/.fehbg ]] && ./.fehbg

# # setxkbmap -option caps:none
xset r rate 150 20

xrdb -merge ~/.Xresources
xmodmap ~/.Xmodmap

pactl load-module module-bluetooth-discover

# start session
DEFAULTSESSION=i3
case "$1" in
  awesome) exec awesome ;;
  gnome-session)  exec gnome-session ;;
  i3) xmodmap ~/.Xmodmap && exec i3;;
  *) xmodmap ~/.Xmodmap && exec $DEFAULTSESSION ;;
esac
