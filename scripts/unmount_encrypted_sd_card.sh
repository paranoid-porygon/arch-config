#!/bin/bash

echo "Attempting to unmount encrypted SD card via script." >> /home/paranoidporygon/logs/umount.txt

echo "Unmounting decrypted SD card at /mnt/sd00..."
sudo umount /mnt/external
sleep 3s

echo "Locking and closing decrypted disk..."
sudo cryptsetup close sd00

echo "Drive unmounted and locked."
