#!/bin/bash

# apt-get update && apt install -y curl && curl -sSL https://raw.githubusercontent.com/jacobm3/gbin/main/live-setup.sh | bash
#
# setup live linux environment with common tools

mkdir -p ~/.ssh
cat > ~/.ssh/authorized_keys <<EOF
ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAID10aN8gGb0s+3LTE43VNFmvQxz5WYL+JlMCVzmZl+f7 jacob.martinson.ed25519.2022.09
EOF

export DEBIAN_FRONTEND=noninteractive
sudo apt-get update
sudo apt-get upgrade -y
sudo apt install -y 7zip btop git htop btop lm-sensors net-tools netdiscover nmap sudo sysstat vim zip unzip zstd \
  zlib1g-dev libjpeg-dev python3-pip \
  nvme-cli smartmontools zfsutils-linux rsync unison-gtk unison nwipe

# https://github.com/louwrentius/fio-plot
pip3 install fio-plot 

git clone https://github.com/jacobm3/gbin.git && echo ". ~/gbin/jacobrc" >> ~/.bashrc && echo ". ~/gbin/jacobrc" >> ~/.bash_profile && ln -s gbin/jacobrc .jacobrc



