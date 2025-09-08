#!/bin/bash
#
# This will become the script to run after the base arch install.
# For now, I am just going to make a list of packages that I remember that I installed and will turn it into a proper script later,
#
# TODO: script the installation of the following packages
# * blackbox
# * sxhkd
# * fbctrl
# * vim
# * w3m
# * glow
# * terminator
# * arch-wiki-lite
# * clamav
# * expressvpn
# * git
# * keepassxc (or a cli alternative?)
# * midori
# * neofetch
# * privoxy
# * pipewire and alsa/pulse/jack packages
# * python 3.xx
# * rkhunter
# * sxhkd
# * tor
# * tor-browser
# * vim-jedi
# * yay-git
# * keepassxc
# * firejail
#
# TODO: script the setup of the following:
# * .vimrc
# * .bashrc
# * firejail and apparmor
#   https://firejail.wordpress.com/documentation-2/firefox-guide/
# * sxhkd hotkeys to use fbctrl
# * .asoundrc
# * install alsa-utils
# * /etc/modprov.d/alsa.conf
# * sxhkd config
# * xinit and startx
# * iptables
# * expressvpn
# * tor and privoxy
# * secure DNS (research this further)
# * set midori to use privoxy
# * encrypted sd card, unmounting on suspend, etc
# * pipewire and make sure volume works
# * TODO investigate wayland vs X11
# * /etc/clamav/freshclam.conf to use tor proxy as socks5h
# * update clamav definitions
# * scan for malware
# * setup rkhunter
# * KeepassXC
# * apparmor
# * fix suspend issues via grub config


# install software
sudo pacman -S blackbox sxhkd fbctrl vim glow terminator clamav git keepassxc privoxy pipewire rkhunter tor vim-jedi yay-git firejail firefox
# sudo pacman -S w3m arch-wiki-lite expressvpn midori neofetch tor-browser

# update config files

## /etc/dhcpcd.conf 
# add the following to EOF

## manually specify DNS servers to query
## 1.1.1.1 1.0.0.1 is Cloudflare
## 8.8.8.8 8.8.4.4 is Google
#static domain_name_servers=8.8.4.4 8.8.8.8

## /etc/systemd/system/root-suspend.service
# actions to perform when system suspends
# TODO might currently impede suspend from working
#

## ~/.config/firejail/
# firejail local config overrides
# *ping
# *firefox
# *tor

## ~/.blackbox/menu
#blackbox wm menu

## fix suspend issues via grub config
# https://wiki.archlinux.org/title/Chrome_OS_devices#Fixing_suspend
# /etc/default/grub
# GRUB_CMDLINE_LINUX_DEFAULT="modprobe.blacklist=ehci_pci"
#
# then rebuild grub
# sudo grub-mkconfig -o /boot/grub/grub.cfg

# change /etc/fstab to make it easier to mount usb flash drives
# /dev/sdc1	/mnt/usb_drive	vfat	rw,user,noauto
