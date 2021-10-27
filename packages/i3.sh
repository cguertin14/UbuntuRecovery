#!/bin/sh

sudo apt install feh fonts-font-awesome rofi pulseaudio-utils xbacklight alsa-tools \
                 clipit gcc git terminator locate pcmanfm acpi libnotify-bin light nitrogen \
                 volumeicon-alsa playerctl blueman i3 i3blocks redshift xfce4-power-manager compton xsecurelock \
                 -y

# Create directories
mkdir -p ~/Documents/Perso
git clone git@github.com:vivien/i3blocks-contrib.git ~/Documents/Perso
