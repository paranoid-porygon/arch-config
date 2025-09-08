#!/bin/bash

echo "mounting flash drive..."
sudo mount -o uid=1000,gid=998 /dev/sdb1 /mnt/flash00/
sleep 1s

cd /mnt/flash00/
./SecurStick-linux &

echo "Opening login page. Close Midori when finished logging in."
sleep 3s
midori -p "http://127.0.0.1:2000/login"

sleep 10s
sudo mount -t davfs -o noexec,uid=1000,gid=998 http://127.0.0.1:2000/X /mnt/securstick/

sleep 1s
cd /mnt/securstick

$SHELL
