#!/bin/sh

# Current directory.
DIR="$( cd "$( dirname "$0" )" && pwd )"

# Move systemd files
for file in $(ls $DIR/*.service)
do
	sudo cp $file /etc/systemd/system/;
done