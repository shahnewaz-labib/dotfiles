#!/bin/sh

# Check monitor config
if [[ `xrandr | grep -w connected | wc -l | grep 1` ]]
then
    # only laptop screen connected
    xrandr --output eDP-1 --auto
else
    xrandr --output eDP-1 --off
    xrandr --output HDMI-1 --auto
fi

# redshift
rdshift

sh .profile

xset r rate 300 30

