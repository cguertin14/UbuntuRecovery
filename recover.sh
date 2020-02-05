#!/bin/sh

# Apply updates
sudo apt update
sudo apt upgrade -y

# Git
sudo apt install git curl -y

# Docker
sudo snap install docker -y
sudo groupadd docker
sudo usermod -aG docker $USER
sudo curl -L "https://github.com/docker/compose/releases/download/1.24.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Kubernetes & Related projects
sudo snap install go --classic
sudo snap install kubectl --classic
sudo snap install helm --classic
sudo snap install minikube --classic
sudo snap install terraform --classic
curl -sL https://run.linkerd.io/install | sh
sudo snap install heroku --classic

# Utilities
sudo apt install net-tools ansible powertop tlp vagrant bat vim -y

# GCloud
sudo apt-get install apt-transport-https ca-certificates gnupg
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -
sudo apt-get update && sudo apt-get install google-cloud-sdk

# Zsh
sudo apt install zsh -y
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
chsh -s $(which zsh)

# fnm (Node JS)
curl -fsSL https://github.com/Schniz/fnm/raw/master/.ci/install.sh | bash
fnm install 12.5.0
fnm use
fnm install
fnm use
fnm use 12.5.0


# Starship (terminal)
curl -fsSL https://starship.rs/install.sh | sudo bash
