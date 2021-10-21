#!/bin/sh

# Current directory.
DIR="$( cd "$( dirname "$0" )" && pwd )"

# Copy scripts to other locations
sudo cp $DIR/cpufreqctl.sh /usr/local/bin/cpufreqctl
sudo cp $DIR/cpupowerctl.sh /usr/local/bin/cpupowerctl