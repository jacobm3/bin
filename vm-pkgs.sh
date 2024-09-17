#!/bin/bash

# 
# export DEBIAN_FRONTEND=noninteractive; apt-get update && apt install -y curl git sudo
# usermod -G sudo -a j; echo '%sudo ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers
# curl -sSL https://raw.githubusercontent.com/jacobm3/gbin/main/live-setup.sh | bash
#

export DEBIAN_FRONTEND=noninteractive
sudo apt-get update
sudo apt-get upgrade -y
sudo apt install -y 7zip awscli azure-cli bash-completion btop cloud-guest-utils curl dnsutils git htop \
	hwinfo jq lm-sensors net-tools netdiscover nmap nvme-cli nwipe python3-pip \
	rsync sipcalc smartmontools sudo sysstat unison unzip vim-nox \
	whois zip zlib1g-dev zstd 

