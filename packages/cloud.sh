#!/bin/sh

# Docker
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh
sudo groupadd docker
sudo usermod -aG docker $USER
sudo curl -L "https://github.com/docker/compose/releases/download/1.24.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Install latest version of Go
LATEST_GO_VERSION="$(curl https://go.dev/VERSION\?m\=text)"
wget https://go.dev/dl/${LATEST_GO_VERSION}.linux-amd64.tar.gz
sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf ${LATEST_GO_VERSION}.linux-amd64.tar.gz
rm -rf go*

# Kubernetes & Cloud-Related projects
sudo snap install kubectl --classic
sudo snap install minikube --classic
sudo snap install terraform --classic
sudo snap install heroku --classic

# Helm
sudo snap install helm --classic
helm repo add stable https://charts.helm.sh/stable

# Kustomize
curl -s "https://raw.githubusercontent.com/kubernetes-sigs/kustomize/master/hack/install_kustomize.sh"  | bash
sudo mkdir -p $DEMO/bin
sudo mv kustomize $DEMO/bin
sudo snap install kustomize
go install github.com/bitnami/kubecfg@latest

# Jsonnet
sudo apt-get install jsonnet -y
go install github.com/grafana/tanka/cmd/tk@latest
go install github.com/jsonnet-bundler/jsonnet-bundler/cmd/jb@latest

# KinD
go install sigs.k8s.io/kind@v0.13.0

# Kubectx & Kubens
sudo git clone https://github.com/ahmetb/kubectx /opt/kubectx
sudo ln -s /opt/kubectx/kubectx /usr/local/bin/kubectx
sudo ln -s /opt/kubectx/kubens /usr/local/bin/kubens

# K3s  
curl -sfL https://get.k3s.io | sh -

# GCloud
echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
sudo apt-get install apt-transport-https ca-certificates gnupg
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -
sudo apt-get update && sudo apt-get install google-cloud-sdk -y

# AWS
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
cd ..
rm -rf awscliv2.zip aws/

# JSON and YAML cli tools (jq & yq)
sudo curl -L "https://github.com/stedolan/jq/releases/download/jq-1.6/jq-linux64" -o /usr/bin/jq
sudo curl -L "https://github.com/mikefarah/yq/releases/download/3.2.1/yq_linux_amd64" -o /usr/bin/yq

# Circle CI CLI
sudo curl -fLSs https://circle.ci/cli | sudo bash
