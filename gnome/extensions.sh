#!/bin/sh

# Current directory.
DIR="$( cd "$( dirname "$0" )" && pwd )"

# Install gnome shell
sudo apt-get install chrome-gnome-shell

# Install extensions
sudo gnome-extensions install $DIR/extensions/caffeine.zip --force
sudo gnome-extensions install $DIR/extensions/cpumanager.zip --force
sudo gnome-extensions install $DIR/extensions/dashtopanel.zip --force
sudo gnome-extensions install $DIR/extensions/userthemes.zip --force
sudo gnome-extensions install $DIR/extensions/wsmatrix.zip --force