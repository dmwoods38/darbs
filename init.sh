#!/bin/bash
apt-get update && apt-get upgrade -y
apt-get install sudo software-properties-common
usermod -aG sudo dmwoods

# Sorry RMS
apt-add-repository non-free
apt-get update
apt-get install firmware-iwlwifi
modprobe -r iwlwifi; modprobe iwlwifi
apt-get install vim xorg firefox-esr net-tools curl wget git i3 dnsutils
apt-get install network-manager-gnome network-manager 

# Appearance stuff
apt-get install lxappearance feh rofi neofetch

# Grab configs from git
git clone https://github.com/dmwoods38/dotfiles.git
cp -r dotfiles/* /home/dmwoods
