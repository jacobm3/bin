#!/bin/bash

latest=$(curl -s https://www.consul.io/downloads  | sed 's/"/\n/g' | grep .zip | grep linux | grep amd64 | grep https | tail -1)

mkdir ~/bin
cd ~/bin
wget $latest

file=$(ls -tr consul*.zip | tail -1)

unzip $file consul

consul version

rm $file
