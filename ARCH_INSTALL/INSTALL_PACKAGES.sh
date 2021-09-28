#!/bin/sh
# sudo pacman -Syu # Download & update mirrors
# sudo pacman -S yay # Install YAY package manager

yay -S base-devel # Install base development packages, which are helpful for installing other packages
yay -S $(cat INSTALL_PACKAGES.txt | xargs) # Install list of all packages
