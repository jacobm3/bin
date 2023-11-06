#!/bin/bash

cat > /root/.ssh/authorized_keys <<EOF
ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAID10aN8gGb0s+3LTE43VNFmvQxz5WYL+JlMCVzmZl+f7 jacob.martinson.ed25519.2022.09
EOF

sed -Ezi.bak "s/(Ext.Msg.show\(\{\s+title: gettext\('No valid sub)/void\(\{ \/\/\1/g" /usr/share/javascript/proxmox-widget-toolkit/proxmoxlib.js && systemctl restart pveproxy.service

rm /etc/apt/sources.list.d/*
echo "deb http://download.proxmox.com/debian/pve bookworm pve-no-subscription" >> /etc/apt/sources.list

apt-get update
apt install -y git htop btop vim nmap netdiscover

git clone https://github.com/jacobm3/gbin.git && echo ". ~/gbin/jacobrc" >> ~/.bashrc && echo ". ~/gbin/jacobrc" >> ~/.bash_profile && ln -s gbin/jacobrc .jacobrc

apt-get upgrade -y


