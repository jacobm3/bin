#!/bin/bash

# 
#
# setup live linux environment with common tools

mkdir -p ~/.ssh
cat > ~/.ssh/authorized_keys <<EOF
ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAID10aN8gGb0s+3LTE43VNFmvQxz5WYL+JlMCVzmZl+f7 jacob.martinson.ed25519.2022.09
EOF

export DEBIAN_FRONTEND=noninteractive
apt-get update
apt-get upgrade -y
apt install -y 7zip btop git htop btop lm-sensors net-tools netdiscover nmap sudo sysstat vim zip unzip zstd \
  zlib1g-dev libjpeg-dev python3-pip \
  nvme-cli smartmontools zfsutils-linux rsync unison-gtk unison

# https://github.com/louwrentius/fio-plot
pip3 install fio-plot 

git clone https://github.com/jacobm3/gbin.git && echo ". ~/gbin/jacobrc" >> ~/.bashrc && echo ". ~/gbin/jacobrc" >> ~/.bash_profile && ln -s gbin/jacobrc .jacobrc



