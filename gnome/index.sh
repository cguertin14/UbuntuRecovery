#!/bin/sh

# Current directory.
DIR="$( cd "$( dirname "$0" )" && pwd )"

# Install themes
$DIR/themes.sh

# Install extensions
$DIR/extensions.sh