#!/bin/sh

# Install i3 dependencies
sudo apt install feh fonts-font-awesome rofi pulseaudio-utils xbacklight alsa-tools \
                 clipit gcc git terminator locate pcmanfm acpi libnotify-bin light nitrogen \
                 volumeicon-alsa lxappearance playerctl blueman i3 redshift xfce4-power-manager compton xsecurelock kitty arandr \
                 -y

# Install i3-gaps dependencies
sudo apt install libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev \
  libxcb-util0-dev libxcb-icccm4-dev libyajl-dev \
  libstartup-notification0-dev libxcb-randr0-dev \
  libev-dev libxcb-cursor-dev libxcb-xinerama0-dev \
  libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev \
  autoconf libxcb-xrm0 libxcb-xrm-dev automake libxcb-shape0-dev \
  meson g++ cmake

# Install i3-gaps
git clone https://www.github.com/Airblader/i3 i3-gaps && cd i3-gaps
mkdir -p build && cd build
meson ..
ninja
sudo cp i3 /usr/bin/i3

# Cleanup
cd ../.. && rm -rf i3-gaps

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
  libxcb-util0-dev \
  libxcb-image0-dev \
  libxcb-icccm4-dev \
  xcb-proto \
  libxcb-ewmh-dev \
  python3-xcbgen \
  libjsoncpp-dev \
  libcairo2-dev \
  libxcb-randr0-dev

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
