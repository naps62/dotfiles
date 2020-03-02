# vim: set syntax=sh:

xset r rate 160 40

host_x_resources="$HOME/.config/Xresources/host/`hostname`"

if [ -f "$host_x_resources" ]; then
  xrdb -merge "$host_x_resources"
fi
