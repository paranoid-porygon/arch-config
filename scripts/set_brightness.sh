#!/bin/bash
read -p "from 1 to 937, set the screen brightness level> " brightness

sudo echo $brightness > /sys/class/backlight/intel_backlight/brightness

# $SHELL
