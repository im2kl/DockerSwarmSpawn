#!/bin/sh

## Requirements
# sudo apt install gnupg
# sudo apt install software-properties-common
# sudo apt install apt-transport-https
# sudo apt install ca-certificates

set -o errexit
set -o nounset

IFS=$(printf '\n\t')

# Docker
# sudo apt remove --yes docker docker-engine docker.io containerd runc
sudo apt update
sudo apt --yes --no-install-recommends install apt-transport-https ca-certificates gnupg2 software-properties-common
wget --quiet --output-document=- https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=$(dpkg --print-architecture)] https://download.docker.com/linux/ubuntu $(lsb_release --codename --short) stable"
sudo apt update
sudo apt --yes --no-install-recommends install docker-ce docker-ce-cli containerd.io
sudo usermod --append --groups docker "$USER"
sudo usermod -aG docker $USER
newgrp docker
sudo systemctl enable docker
printf '\nDocker installed successfully\n\n'

printf 'Waiting for Docker to start...\n\n'
sleep 5