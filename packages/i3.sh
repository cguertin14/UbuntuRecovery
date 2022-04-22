#!/bin/sh

# Install i3 dependencies
sudo apt install feh fonts-font-awesome rofi pulseaudio-utils xbacklight alsa-tools \
                 clipit gcc git terminator locate pcmanfm acpi libnotify-bin light nitrogen \
                 volumeicon-alsa lxappearance playerctl blueman i3 redshift xfce4-power-manager compton xsecurelock kitty arandr \
                 -y

# i3-gaps installation
sudo add-apt-repository ppa:regolith-linux/release
sudo apt update
sudo apt install i3-gaps

# Install polybar dependencies
mkdir -p $HOME/.config/polybar
pip3 install pywal 
sudo apt install -y \
  python3-sphinx \
  libuv1-dev \
  libasound2-dev \
  libcurl4-openssl-dev \
  libmpdclient-dev \
  libiw-dev \
  libpulse-dev \
  libxcb-composite0-dev \
  xcb-proto \
  libxcb-ewmh-dev \
  python3-xcbgen \
  libjsoncpp-dev

# Install polybar by compiling it
POLYBAR_VERSION="3.6.2"
wget https://github.com/polybar/polybar/releases/download/${POLYBAR_VERSION}/polybar-${POLYBAR_VERSION}.tar.gz
tar -xvf polybar-${POLYBAR_VERSION}.tar.gz
cd polybar-${POLYBAR_VERSION}/

# Compile polybar and cp binaries elsewhere
./build.sh -f -g -j --all-features
sudo cp build/bin/polybar* /usr/local/bin/

# Cleanup
cd .. && rm -rf polybar-${POLYBAR_VERSION}*

# Install rofi themes
git clone --depth=1 git@github.com:adi1090x/rofi.git
cd rofi && ./setup.sh

# Cleanup
cd .. && rm -rf rofi*