#!/bin/bash
USER=dmwoods
GOVERSION=1.10.2
ARCH=amd64
apt-get update && apt-get upgrade -y
usermod -aG sudo $USER

apt-get install -y vim net-tools curl wget git i3 dnsutils vim-pathogen dconf-editor

# Allow repo installation over HTTPS
apt-get install -y apt-transport-https ca-certificates gnupg2 software-properties-common
# Add Docker GPG key
curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
# Need to verify the GPG key
# Add Docker repo
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian \
	      $(lsb_release -cs) stable"
apt-get update && apt-get install -y docker-ce
usermod -aG docker $USER

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
