#!/usr/bin/env bash

sudo apt install vim git curl terminator tig zsh htop -y

# NVM
sh -c "$(curl -fsSL https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.0/install.sh)"

# NODE + NPM
nvm install stable
nvm use stable

# Docker
sudo apt remove docker docker-engine docker.io containerd runc -y
sudo apt update
sudo apt install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release -y

sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt update
sudo apt install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y


# OH MY ZSH
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

mkdir ~/projects

