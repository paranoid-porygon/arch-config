#!/bin/bash
# optional: redownload pgp keys
#sudo rm -R /etc/pacman.d/gnupg/
#sudo pacman-key --init
#sudo pacman-key --populate

## Update official packages
sudo pacman -Sy --needed archlinux-keyring  # updates PGP signatures for repos
sudo pacman -Su # systemwide update

## Update Yay
### note: currently redundant since yay updates itself from the AUR
# TODO check if yay doesn't exist and then install, otherwise update itself
#cd /tmp
##sudo pacman -R yay-bin yay-bin-debug  # remove old yay bins
#sudo pacman -S --needed git base-devel # make sure needed packages for compilation are installed
#git clone https://aur.archlinux.org/yay.git  # clone yay from aur repo
##cd yay-git
##git clone https://aur.archlinux.org/yay  # clone yay from AUR
#cd yay
#makepkg -si  # reinstall yay from source

## Update AUR packages
yay -Syu  # update AUR packages now that official packages are already updated


# clear package tempfiles
#sudo pacman -Qdtq | sudo pacman -Rs -  # use with caution since this might be needed
yay -Sc


####### Firmware Update #######

# update firmware
sudo pacman -S fwupd flashrom linux-firmware git wget vim
# there's a bug with the current fwupd package so use 2.0.13-1 instead
sudo rm /var/lib/fwupd/pending.db
sudo pacman -U https://archive.archlinux.org/packages/f/fwupd/fwupd-2.0.13-1-x86_64.pkg.tar.zst
fwupdmgr refresh
fwupdmgr update


read -p "Press any key to reboot... " -n 1 -s -r
echo -e "\n"

shutdown -r now
