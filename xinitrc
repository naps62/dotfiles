# set the cursor
xsetroot -cursor_name left_ptr

# set PT keyboard layout
setxkbmap -layout pt

# start session
DEFAULTSESSION=gnome-session
case "$1" in
  awesome) exec awesome ;;
  gnome-session)  exec gnome-session ;;
  *) exec $DEFAULTSESSION ;;
esac

# xcape -e 'Caps_Lock=Control;Control_L=Control_L|O'

[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

