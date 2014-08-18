# set the cursor
xsetroot -cursor_name left_ptr

# set PT keyboard layout
setxkbmap -layout pt

# start session
DEFAULTSESSION=awesome
case "$1" in
  awesome) exec awesome ;;
  gnome-session)  exec gnome-session ;;
  *) exec $DEFAULTSESSION ;;
esac

[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
