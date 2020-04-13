#! /usr/bin/bash
# Sets right perspective when monitor is plugged in
# Needed by udev rule /etc/udev/rules.d/95-hotplug-monitor
export DISPLAY=:0
export XAUTHORITY=/home/c/.Xauthority

function connectHDMI(){
	xrandr --output LVDS-1 --off --output VGA-1-2 --off --output DP-1 --off --output HDMI-1 --primary --mode 1366x768 --pos 0x0 --rotate normal
}

function connect(){
	xrandr --output LVDS-1 --off --output VGA-1-2 --off --output DP-1 --off --output HDMI-1 --off --output VGA-1 --primary --mode 1366x768 --pos 0x0 --rotate normal
}

function disconnect(){
	xrandr --output LVDS-1 --primary --mode 1366x768 --pos 0x0 --rotate normal --output VGA-1-2 --off --output DP-1 --off --output HDMI-1 --off --output VGA-1 --off
}

function main(){
    xrandr | grep "HDMI-1 connected" &> /dev/null && connectHDMI && return
    xrandr | grep "VGA-1 connected" &> /dev/null && connect || disconnect
}
main
