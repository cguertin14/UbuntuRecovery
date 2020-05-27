#!/bin/sh

# Current directory.
DIR="$( cd "$( dirname "$0" )" && pwd )"

# Install aliases.
cp $DIR/.docker_aliases ~/.docker_aliases
cp $DIR/.kubectl_aliases ~/.kubectl_aliases