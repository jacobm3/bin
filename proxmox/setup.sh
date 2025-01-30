#!/bin/bash -x

set -e

mkdir ~/src
cd ~/src
apt-get update
apt install nala 

nala upgrade

nala install git
git clone https://github.com/Meliox/PVE-mods.git
cd PVE-mods
./pve-mod-all.sh

echo Log out of proxmox and clear your cache.
