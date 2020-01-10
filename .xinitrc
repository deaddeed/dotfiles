#!/bin/sh

setxkbmap \
    -option \
    -option altwin:swap_alt_win

xmodmap \
    -e 'clear Lock' \
    -e 'keycode 66 = Escape' \
    -e 'add mod3 = Escape' \
    -e 'keycode 0x69 = Caps_Lock'

##To log the output from i3, add this line instead:
#exec i3 -V >> ~/i3log-$(date +'%F-%k-%M-%S') 2>&1
exec i3

/usr/local/bin/hotplug_monitor.sh &
