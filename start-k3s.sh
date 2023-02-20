#!/bin/bash

sudo screen -d -m -L -Logfile /var/log/k3s.log -S k3s-server /usr/local/bin/k3s server
sleep 5
sudo chown ubuntu:ubuntu /etc/rancher/k3s/k3s.yaml
sudo chmod 600 /etc/rancher/k3s/k3s.yaml

set -x
kubectl cluster-info
kubectl get namespace
