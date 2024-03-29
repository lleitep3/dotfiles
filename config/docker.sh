#!/usr/bin/env bash
##########################
# intall docker
##########################

sudo apt install apt-transport-https ca-certificates
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
echo "deb https://apt.dockerproject.org/repo ubuntu-xenial main" | sudo tee /etc/apt/sources.list.d/docker.list
sudo apt update
apt-cache policy docker-engine
sudo apt install linux-image-extra-$(uname -r) linux-image-extra-virtual
sudo apt update
sudo apt install docker-engine
sudo service docker start
sudo groupadd docker
sudo usermod -aG docker $USER


##########################
# intall docker-compose
##########################

curl -L "https://github.com/docker/compose/releases/download/1.8.1/docker-compose-$(uname -s)-$(uname -m)" > $DOTFILES/bin/docker-compose
chmod +x $DOTFILES/bin/docker-compose