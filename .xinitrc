#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

# Laptop monitor
INTERNAL_OUTPUT="eDP"
# The external monitor
EXTERNAL_OUTPUT="HDMI-A-0"

xrandr | grep "$EXTERNAL_OUTPUT disconnected"
if [ $? -eq 0 ]; then
    xrandr --output $EXTERNAL_OUTPUT --off --output $INTERNAL_OUTPUT --auto
else
    xrandr --output $INTERNAL_OUTPUT --primary --auto --output $EXTERNAL_OUTPUT --right-of $INTERNAL_OUTPUT --auto 
fi
