#!/bin/bash -x

set -e

mkdir ~/src
cd ~/src
apt install nala git
git clone https://github.com/Meliox/PVE-mods.git
cd PVE-mods
./pve-mod-all.sh

