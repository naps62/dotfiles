# set the cursor
xsetroot -cursor_name left_ptr

# set PT keyboard layout
setxkbmap -layout pt

# start xfce
exec startxfce4

[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
