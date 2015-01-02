# set the cursor
xsetroot -cursor_name left_ptr

feh --bg-scale /home/naps62/data/wallpaper.jpg
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

# set PT keyboard layout
setxkbmap -layout pt
setxkbmap -option caps:escape

# map shift keys to (), control keys to {} and alt keys to []
PARENTHESIS="Shift_L=Shift_L|8;Shift_R=Shift_L|9"
BRACKETS="Control_L=ISO_Level3_Shift|7;Control_R=ISO_Level3_Shift|0"
SQUARE_BRACKETS="Alt_L=ISO_Level3_Shift|8;ISO_Level3_Shift=ISO_Level3_Shift|9"
xcape -t 150 -e "${PARENTHESIS};${BRACKETS};${SQUARE_BRACKETS}"

# start session
DEFAULTSESSION=gnome-session
case "$1" in
  awesome) exec awesome ;;
  gnome-session)  exec gnome-session ;;
  xmonad) exec xmonad ;;
  *) exec $DEFAULTSESSION ;;
esac

