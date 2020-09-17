#!/bin/sh
GO111MODULE="on"

# Docker
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh
sudo groupadd docker
sudo usermod -aG docker $USER
sudo curl -L "https://github.com/docker/compose/releases/download/1.24.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Kubernetes & Related projects
sudo snap install doctl
sudo snap install go --classic
sudo snap install kubectl --classic
sudo snap install helm --classic
sudo snap install minikube --classic
curl -sL https://run.linkerd.io/install | sh
sudo snap install heroku --classic

# Kustomize
curl -s "https://raw.githubusercontent.com/kubernetes-sigs/kustomize/master/hack/install_kustomize.sh"  | bash
sudo mkdir -p $DEMO/bin
sudo mv kustomize $DEMO/bin
sudo snap install kustomize
go get github.com/bitnami/kubecfg

# Jsonnet
sudo apt-get install jsonnet -y
go get github.com/grafana/tanka/cmd/tk
go get github.com/jsonnet-bundler/jsonnet-bundler/cmd/jb

# KinD
curl -Lo ./kind "https://github.com/kubernetes-sigs/kind/releases/download/v0.9.0/kind-$(uname)-amd64"
chmod +x ./kind
sudo mv ./kind /usr/bin/kind

# Kubectx & Kubens
sudo git clone https://github.com/ahmetb/kubectx /opt/kubectx
sudo ln -s /opt/kubectx/kubectx /usr/local/bin/kubectx
sudo ln -s /opt/kubectx/kubens /usr/local/bin/kubens

# K3s  
curl -sfL https://get.k3s.io | sh -

# Terraform
wget https://releases.hashicorp.com/terraform/0.13.1/terraform_0.13.1_linux_amd64.zip
sudo unzip ./terraform_0.13.1_linux_amd64.zip -d /usr/local/bin/
rm terraform_0.13.1_linux_amd64.zip

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
