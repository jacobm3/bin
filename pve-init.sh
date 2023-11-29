#!/bin/bash -x

# curl -sSL https://raw.githubusercontent.com/jacobm3/gbin/main/pve-init.sh | bash 

mkdir -p ~/.ssh
cat > ~/.ssh/authorized_keys <<EOF
ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAID10aN8gGb0s+3LTE43VNFmvQxz5WYL+JlMCVzmZl+f7 jacob.martinson.ed25519.2022.09
EOF

zfs set compression=zstd-fast rpool

rm /etc/apt/sources.list.d/*
echo "deb http://download.proxmox.com/debian/pve bookworm pve-no-subscription" >> /etc/apt/sources.list

export DEBIAN_FRONTEND=noninteractive
apt-get update
apt-get upgrade -y
apt install -y 7zip btop git htop lm-sensors net-tools netdiscover nmap nvme-cli sudo sysstat vim zip unzip libsasl2-modules mailutils postfix-pcre

# setup snmpd 
apt install -y snmpd snmp
cp /etc/snmp/snmpd.conf /etc/snmp/snmpd.conf.dist
sed -i "s/^sysLocation .*/sysLocation $HOSTNAME Houston Office/" /etc/snmp/snmpd.conf
sed -i 's/^agentaddress .*/agentaddress 0.0.0.0/' /etc/snmp/snmpd.conf
sed -i 's/^rocommunity .*/rocommunity  public default/' /etc/snmp/snmpd.conf
/etc/init.d/snmpd restart
# snmpwalk -v 2c -c public localhost

git clone https://github.com/jacobm3/gbin.git && echo ". ~/gbin/jacobrc" >> ~/.bashrc && echo ". ~/gbin/jacobrc" >> ~/.bash_profile && ln -s gbin/jacobrc .jacobrc

cat >> /etc/network/interfaces <<EOF

auto vmbr1
iface vmbr1 inet static
        address 10.0.1.254/24
        bridge-ports none
        bridge-stp off
        bridge-fd 0

EOF

sed -Ezi.bak "s/(Ext.Msg.show\(\{\s+title: gettext\('No valid sub)/void\(\{ \/\/\1/g" /usr/share/javascript/proxmox-widget-toolkit/proxmoxlib.js 
systemctl restart pveproxy.service

# from working pve node:
# cd /etc/postfix && scp main.cf sasl_passwd* smtp_header_checks* NEWIP:/etc/postfix
# update hostname in /etc/postfix/main.cf and smtp_header_checks
