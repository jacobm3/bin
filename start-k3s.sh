#!/bin/bash

sudo screen -d -m -L -Logfile /var/log/k3s.log /usr/local/bin/k3s server
sleep 5
sudo chown root:ubuntu /etc/rancher/k3s/k3s.yaml
sudo chmod 640 /etc/rancher/k3s/k3s.yaml

