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
curl -sL https://run.linkerd.io/install | sh
sudo snap install heroku --classic

# Utilities
sudo apt install net-tools ansible powertop tlp vagrant bat vim unzip wget -y

# Terraform
wget https://releases.hashicorp.com/terraform/0.12.21/terraform_0.12.21_linux_amd64.zip
sudo unzip ./terraform_0.12.21_linux_amd64.zip -d /usr/local/bin/
rm terraform_0.12.21_linux_amd64.zip

# GCloud
sudo apt-get install apt-transport-https ca-certificates gnupg
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -
sudo apt-get update && sudo apt-get install google-cloud-sdk

# AWS
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
cd ..
rm -rf awscliv2.zip aws/

# K3s  
curl -sfL https://get.k3s.io | sh -

# Zsh
sudo apt install zsh -y
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
chsh -s $(which zsh)

# fnm (Node JS)
curl -fsSL https://github.com/Schniz/fnm/raw/master/.ci/install.sh | bash
fnm install 11.12.0
fnm use
fnm install
fnm use
fnm use 11.12.0
fnm default 11.12.0

# JSON and YAML cli tools (jq & yq)
sudo curl -L "https://github.com/stedolan/jq/releases/download/jq-1.6/jq-linux64" -o /usr/bin/jq
sudo curl -L "https://github.com/mikefarah/yq/releases/download/3.2.1/yq_linux_amd64" -o /usr/bin/yq

# Starship (terminal)
curl -fsSL https://starship.rs/install.sh | sudo bash
