#!/bin/bash -x

sudo screen -XS k3s-server quit
ps aux | grep /var/lib/rancher/k3s | grep -v grep | awk '{print $2}' | sudo xargs kill
sudo /usr/local/bin/k3s-killall.sh


