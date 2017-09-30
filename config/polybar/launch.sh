#!/bin/sh

# terminate already running instances
killall -q polybar

# wait until they die of blood loss
while pgrep -x polybar >/dev/null; do sleep 1; done

# launch bar
polybar bottom
