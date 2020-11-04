#!/bin/sh

# Current directory.
DIR="$( cd "$( dirname "$0" )" && pwd )"

# Install config files.
cp $DIR/.zshrc ~/.zshrc
cp $DIR/vscode_settings.json ~/.config/Code/User/settings.json