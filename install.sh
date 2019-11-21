#!/usr/bin/env bash

apt install vim git curl terminator tig zsh htop -y

# NVM
sh -c "$(curl -fsSL https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.0/install.sh)"

# NODE + NPM
nvm install stable
nvm use stable

# Docker
sudo apt-get remove docker docker-engine docker.io
sudo apt-get update
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

sudo apt-get update
sudo apt-get install docker-ce


# OH MY ZSH
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

