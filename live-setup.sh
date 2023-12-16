#!/bin/bash

# 
# export DEBIAN_FRONTEND=noninteractive; apt-get update && apt install -y curl git sudo
# usermod -G sudo -a j; echo '%sudo ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers
# curl -sSL https://raw.githubusercontent.com/jacobm3/gbin/main/live-setup.sh | bash
#

mkdir -p ~/.ssh
cat > ~/.ssh/authorized_keys <<EOF
ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAID10aN8gGb0s+3LTE43VNFmvQxz5WYL+JlMCVzmZl+f7 jacob.martinson.ed25519.2022.09
EOF

export DEBIAN_FRONTEND=noninteractive
sudo apt-get update
sudo apt-get upgrade -y
sudo apt install -y 7zip bash-completion btop cloud-guest-utils curl git htop hwinfo lm-sensors net-tools netdiscover nmap nvme-cli nwipe python3-pip rsync smartmontools sudo sysstat unison unzip vim-nox zip zlib1g-dev zstd 

# unset DEBIAN_FRONTEND
# sudo apt install -y zfsutils-linux 

# https://github.com/louwrentius/fio-plot
#pip3 install fio-plot 

git clone https://github.com/jacobm3/gbin.git && echo ". ~/gbin/jacobrc" >> ~/.bashrc && echo ". ~/gbin/jacobrc" >> ~/.bash_profile && ln -s gbin/jacobrc .jacobrc

mkdir -p ~/.config/htop
cp ~/gbin/.config/htop/htoprc ~/.config/htop/htoprc


