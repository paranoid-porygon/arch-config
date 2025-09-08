#!/bin/bash
#exec upower -i `upower -e | grep 'BAT'`
grep . /sys/class/scsi_host/host*/link_power_management_policy
cat /sys/class/power_supply/BAT0/capacity

