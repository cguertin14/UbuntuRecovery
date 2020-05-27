#!/bin/sh

# Current directory.
DIR="$( cd "$( dirname "$0" )" && pwd )"
DESTINATION=/usr/share/fonts/truetype/

# Install fonts.
sudo cp -r $DIR/firacode $DESTINATION
sudo cp -r $DIR/hack $DESTINATION