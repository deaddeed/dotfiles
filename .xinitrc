#!/bin/sh

setxkbmap \
    -option \
    -option caps:none \
    -option ctrl:nocaps

xmodmap \
    -e 'keycode 66 = Escape' \
    -e 'keycode 9 = NoSymbol' \
    -e 'keycode 64 = Hyper_L Meta_L Alt_L Meta_L' \
    -e 'keycode 133 = Mode_switch Super_L Mode_switch Super_L' \
    -e 'keycode 43 = h H Left NoSymbol Left NoSymbol Left' \
    -e 'keycode 44 = j J Down NoSymbol Down NoSymbol Down' \
    -e 'keycode 45 = k K Up NoSymbol Up NoSymbol Up' \
    -e 'keycode 46 = l L Right NoSymbol Right NoSymbol Right' \
    -e 'keycode 0x69 = Caps_Lock'

##To log the output from i3, add this line instead:
#exec i3 -V >> ~/i3log-$(date +'%F-%k-%M-%S') 2>&1
exec i3

/usr/local/bin/hotplug_monitor.sh &
