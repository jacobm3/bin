#!/bin/bash


latest=$(curl -s https://www.vaultproject.io/downloads  | sed 's/"/\n/g' | grep .zip | grep linux | grep amd64 | grep ent | grep https | tail -1)

mkdir ~/bin
cd ~/bin
wget $latest

file=$(ls -tr vault*.zip | tail -1)

unzip $file vault

vault version

rm $file
