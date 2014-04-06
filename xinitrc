# set the cursor
xsetroot -cursor_name left_ptr

# set PT keyboard layout
setxkbmap -layout pt

# start xfce
exec awesome

[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
