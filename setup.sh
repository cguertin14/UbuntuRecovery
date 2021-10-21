#!/bin/sh

# Install scripts.
./scripts/index.sh

# Apply updates.
sudo apt update && sudo apt upgrade -y

# Install packages.
./packages/index.sh

# Install gnome configuration.
./gnome/index.sh

# Install configuration files.
./config/index.sh

# Install Cloud packages.
./cloud/index.sh

# Cleanup.
rm -rf get-docker.sh awscliv2.zip aws/