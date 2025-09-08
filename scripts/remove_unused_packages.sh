#!/bin/bash
echo "Disk space before clearing files:"
exec df | pcregrep -M '(Filesystem|/dev/sd[a-z0-9]+)'
echo -e "\n"
#echo "removing unused dependencies..."
#sudo pacman -Qdtq | sudo pacman -Rs -
echo "clearing the package cache..."
#sudo pacman -Sc  # removes files from official sources
yay -Sc  # removes files from official soruces and AUR
echo "Disk space after clearing files:"
exec df | pcregrep -M '(Filesystem|/dev/sd[a-z0-9]+)'
echo -e "\n"

# further reading:
# https://herbort.me/posts/automatically-cleaning-pacman-and-yay-cache-in-arch-linux/
