#!/usr/bin/env bash

apt install vim git curl terminator tig -y

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo "source ~/.dotfiles/z.sh" >> ~/.zshrc
echo "source ~/.dotfiles/alias.sh" >> ~/.zshrc

source config/chrome.sh
source config/vscode.sh
source config/docker.sh
source config/nvm.sh
source config/npm.sh
source config/spotify.sh