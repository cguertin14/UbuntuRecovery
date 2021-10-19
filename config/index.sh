#!/bin/sh

# Current directory.
DIR="$( cd "$( dirname "$0" )" && pwd )"

# Create directories
mkdir -p ~/.config/i3

# Install config files.
cp $DIR/i3.config ~/.config/i3/config
cp $DIR/.zshrc ~/.zshrc
cp $DIR/vscode_settings.json ~/.config/Code/User/settings.json
cp $DIR/tilda_config ~/.config/tilda/config_0
cp $DIR/startship.toml ~/.config/startship.toml
