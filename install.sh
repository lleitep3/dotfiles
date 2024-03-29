#!/usr/bin/env bash

sudo apt install vim git curl wget terminator tig zsh htop -y

# VIM config
echo \
"syntax on
colorscheme industry
filetype indent on
set number
set tabstop=2
set autoindent
set expandtab
set softtabstop=4
set cursorline
set showcmd
set backspace=indent,eol,start
set number
set list

" Display different types of white spaces. "
set listchars=tab:›\ ,trail:•,extends:#,nbsp:.
set viminfo='100,<9999,s100
" > ~/.vimrc

# OH MY ZSH
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# NVM
sh -c "$(curl -fsSL https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.0/install.sh)"

echo \
'export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion' \
 >> ~/.zshrc
 
 echo \
'export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion' \
 >> ~/.bashrc

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# NODE + NPM
nvm install stable
nvm use stable

# Docker
sudo apt-get update
sudo apt-get install \
    ca-certificates \
    curl \
    gnupg

sudo mkdir -m 0755 -p /etc/apt/keyrings

curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y

sudo usermod -aG docker $USER

sudo service docker start

echo '[boot]
command="service docker start"' > /etc/wsl.conf

mkdir ~/projects

