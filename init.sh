#!/bin/bash
USER=dmwoods
apt-get update && apt-get upgrade -y
apt-get install -y sudo software-properties-common
usermod -aG sudo $USER

apt-get install -y vim net-tools curl wget git i3 dnsutils

# Appearance stuff
apt-get install -y neofetch i3blocks
apt-get install -y fonts-font-awesome xfonts-terminus

# Grab configs from git
git clone https://github.com/dmwoods38/dotfiles.git
cp -r dotfiles/.* /home/$USER
chown -R $USER:$USER /home/$USER

# Cleanup files
rm -rf dotfiles
rm /home/$USER/Readme.md
