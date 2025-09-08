#!/bin/bash
cd ~

echo "opening midori to logoff..."
midori -p "http://127.0.0.1:2000/login2"

sudo umount /mnt/securstick
sudo umount -f /dev/sdb1
