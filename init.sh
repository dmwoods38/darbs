#!/bin/bash
USER=dmwoods
apt-get update && apt-get upgrade -y
apt-get install -y sudo software-properties-common
usermod -aG sudo $USER

# Sorry RMS
apt-add-repository non-free
apt-get update
apt-get install -y firmware-iwlwifi
modprobe -r iwlwifi; modprobe iwlwifi
apt-get install -y vim xorg firefox-esr net-tools curl wget git i3 dnsutils
apt-get install -y network-manager-gnome network-manager ranger scrot imagemagick 
apt-get install -y exfat-utils psmisc

# Appearance stuff
apt-get install -y lxappearance feh rofi neofetch i3blocks compton
apt-get install -y fonts-font-awesome arandr blackbird-gtk-theme xfonts-terminus

# Grab configs from git
git clone https://github.com/dmwoods38/dotfiles.git
cp -r dotfiles/.* /home/$USER
chown -R $USER:$USER /home/$USER

# Cleanup files
rm -rf dotfiles
rm /home/$USER/Readme.md
