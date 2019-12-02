#!/bin/sh

setxkbmap -option 'altwin:swap_alt_win'

##To log the output from i3, add this line instead:
#exec i3 -V >> ~/i3log-$(date +'%F-%k-%M-%S') 2>&1
exec i3

/usr/local/bin/hotplug_monitor.sh &
