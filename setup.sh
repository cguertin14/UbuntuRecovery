#!/bin/sh

# Apply updates.
sudo apt update && sudo apt upgrade -y

# Install packages.
./packages/index.sh

# Install themes.
./themes/index.sh

# Install configuration files.
./config/index.sh

# Cleanup.
rm -rf get-docker.sh awscliv2.zip aws/