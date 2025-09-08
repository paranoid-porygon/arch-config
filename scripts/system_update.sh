#!/bin/bash
# optional: redownload pgp keys
#sudo rm -R /etc/pacman.d/gnupg/
#sudo pacman-key --init
#sudo pacman-key --populate

sudo pacman -S archlinux-keyring  # updates PGP signatures for repos
sudo pacman -Syu # systemwide update


cd /tmp
sudo pacman -R yay-bin yay-bin-debug  # remove old yay bins
sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay-git && makepkg -si  # reinstall yay from source
yay -Syu  # update AUR packages now that official packages are already updated


# clear package tempfiles
#sudo pacman -Qdtq | sudo pacman -Rs -  # use with caution since this might be needed
yay -Sc

shutdown -r now
