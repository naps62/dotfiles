# set the cursor
xsetroot -cursor_name left_ptr

feh --bg-scale /home/naps62/.wallpaper.jpg
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

# setxkbmap -option caps:none
xmodmap ~/.Xmodmap

xrdb -merge ~/.Xresources

# start session
DEFAULTSESSION=gnome-session
case "$1" in
  awesome) exec awesome ;;
  gnome-session)  exec gnome-session ;;
  xmonad) exec xmonad ;;
  *) exec $DEFAULTSESSION ;;
esac

