#!/bin/bash

# This script will print a bunch of useful stats about current status of the c720. I think this will be more resource-efficient than having any kind of always-running and updating system try icons or a conky display.

# color consts
LIGHTCYAN='\033[0;36m'
NC='\033[0m' # No Color

echo -e "${LIGHTCYAN}*Acer c720 Overview*${NC}"

echo ***Current Battery Status***
exec upower -i `upower -e | grep 'BAT'` | pcregrep -M '(percentage|state|time to (empty|full))'
echo -e "\n"

echo ***Current Memory Usage***
exec cat /proc/meminfo | pcregrep -M '(Mem|Swap)'
echo -e "\n"

echo ***Current Disk Usage***
#exec df | pcregrep -M '(Filesystem|/dev/sd[a-z0-9]+)'
exec df | pcregrep -M '(^Filesystem|^/dev/*+)'
echo -e "\n"

echo ***Current Network Status***

echo -e "${LIGHTCYAN}ExpressVPN status${NC}"
exec expressvpn status | pcregrep "(c|C)onnected"
echo -e "${NC}"
exec expressvpn status | pcregrep -A 4 'Reconnecting to'

echo -e "${LIGHTCYAN}TOR status${NC}"
exec systemctl status tor.service | pcregrep "(Active|Memory)"
exec curl -x socks5h://localhost:9050 -s https://check.torproject.org/api/ip | cat
echo -e "\n\n"

echo -e "${LIGHTCYAN}Privoxy status${NC}"
exec systemctl status privoxy.service | pcregrep "(Active|Memory)"

read -p "Press any key to exit... " -n 1 -s -r
echo -e "\n"

