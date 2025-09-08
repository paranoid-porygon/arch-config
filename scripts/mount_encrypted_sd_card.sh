#!/bin/bash

echo "Decrypting disk /dev/sdb1..."
sudo cryptsetup open /dev/sdb1 sd00
sleep 1s

echo "Mounting decrypted disk to /mnt/sd00..."
#sudo mount -t ntfs -o noexec,uid=1000,gid=998 /dev/mapper/sd00 /mnt/sd00
sudo mount -t ntfs -o noexec,umask=0000,uid=1000,gid=998 /dev/mapper/sd00 /mnt/external

echo "Drive decrypted and mounted. Remember to unmount and encrypt when you are done!"

$SHELL
