#!/bin/bash
# update and run rkhunter

exec sudo rkhunter --update
exec sudo rkhunter --propupd
exec sudo rkhunter --check --sk

read -p "Press any key to exit... " -n 1 -s -r
echo -e "\n"
