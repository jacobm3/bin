#!/bin/bash

# curl -sSL https://raw.githubusercontent.com/jacobm3/gbin/main/lvgrow.sh | sudo bash

# extend a partition and LVM filesystem using the default paths in ubuntu22
export DEBIAN_FRONTEND=noninteractive

which growpart || apt install -y cloud-guest-utils
echo Before:
df -h /
echo

growpart /dev/sda 3
pvresize /dev/sda3
lvresize -l+100%FREE --resizefs /dev/mapper/ubuntu--vg-ubuntu--lv

echo
echo After:
df -h /
