# set the cursor
xsetroot -cursor_name left_ptr

feh --bg-scale /home/naps62/.wallpaper.jpg
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

# # setxkbmap -option caps:none
xset r rate 150 20

xrdb -merge ~/.Xresources

# start session
DEFAULTSESSION=i3
case "$1" in
  awesome) exec awesome ;;
  gnome-session)  exec gnome-session ;;
  i3) xmodmap ~/.Xmodmap && exec i3;;
  *) xmodmap ~/.Xmodmap && exec $DEFAULTSESSION ;;
esac

