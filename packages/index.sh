#!/bin/sh

# Current directory.
DIR="$( cd "$( dirname "$0" )" && pwd )"

# Utilities packages.
$DIR/utilities.sh

# Cloud packages.
$DIR/cloud.sh

# Terminal packages.
$DIR/terminal.sh

# Desktop packages.
$DIR/desktop.sh

# Other packages.
$DIR/other.sh