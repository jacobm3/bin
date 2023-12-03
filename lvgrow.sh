#!/bin/bash

# extend a partition and LVM filesystem using the default paths in ubuntu22
export DEBIAN_FRONTEND=noninteractive

which growpart || apt install -y cloud-guest-utils

growpart /dev/sda 3
pvresize /dev/sda3
lvresize -l+100%FREE --resizefs /dev/mapper/ubuntu--vg-ubuntu--lv
