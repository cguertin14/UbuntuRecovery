#!/bin/sh

# Apply updates
sudo apt update
sudo apt upgrade -y

# Git
sudo apt install git curl -y

# Docker
curl -fsSL https://get.docker.com -o get-docker.sh 
sh get-docker.sh && sudo usermod -aG docker cguertz
sudo curl -L "https://github.com/docker/compose/releases/download/1.24.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Kubernetes & Related projects
sudo snap install kubectl --classic
sudo snap install helm --classic
sudo snap install minikube --classic
sudo snap install terraform --classic
curl -sL https://run.linkerd.io/install | sh

# Zsh
sudo apt install zsh -y
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
chsh -s $(which zsh)

# Nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash

# Starship (terminal)
curl -fsSL https://starship.rs/install.sh | bash
