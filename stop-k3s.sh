#!/bin/bash -x

sudo screen -r
ps aux | grep /var/lib/rancher/k3s | grep -v grep | awk '{print $2}' | sudo xargs kill
sudo /usr/local/bin/k3s-killall.sh


