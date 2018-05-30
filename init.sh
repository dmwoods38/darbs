#!/bin/bash
USER=dmwoods
GOVERSION=1.10.2
ARCH=amd64
apt-get update && apt-get upgrade -y
usermod -aG sudo $USER

apt-get install -y vim net-tools curl wget git i3 dnsutils vim-pathogen dconf-editor

# Appearance stuff
apt-get install -y neofetch i3blocks rxvt-unicode
apt-get install -y fonts-font-awesome xfonts-terminus

# Grab configs from git
git clone https://github.com/dmwoods38/dotfiles.git
cp -r dotfiles/.* /home/$USER

# Install go
wget https://dl.google.com/go/go$GOVERSION.linux-$ARCH.tar.gz
tar -C /usr/local -xzf go$GOVERSION.linux-$ARCH.tar.gz

# Install dep
sh dep_install.sh

# Cleanup files
rm -rf dotfiles
rm /home/$USER/Readme.md
rm go$GOVERSION.linux-$ARCH.tar.gz


# install vim-go
mkdir -p /home/$USER/.vim/bundle
git clone https://github.com/fatih/vim-go.git /home/$USER/.vim/bundle/vim-go 
chown -R $USER:$USER /home/$USER
