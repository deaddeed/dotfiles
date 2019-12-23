#!/bin/sh

setxkbmap \
    -option \
    -option altwin:swap_alt_win \
    -option caps:none \
    -option caps:ctrl_modifier \
    -option shift:both_capslock_cancel
xmodmap -e 'keycode 0x42 = Escape' -e 'keycode 0x69 = Caps_Lock'

##To log the output from i3, add this line instead:
#exec i3 -V >> ~/i3log-$(date +'%F-%k-%M-%S') 2>&1
exec i3

/usr/local/bin/hotplug_monitor.sh &
