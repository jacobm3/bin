echo '%sudo  ALL=(ALL) NOPASSWD: ALL' | sudo tee -a /etc/sudoers

ln -s /mnt/c/Users/jacob/Documents documents

ln -s /mnt/c/Users/jacob/Downloads downloads

mkdir documents/j

ln -s documents/j .

sudo apt install -y curl git

git clone https://github.com/jacobm3/gbin.git && echo ". ~/gbin/jacobrc" >> ~/.bashrc

echo ". ~/gbin/jacobrc" >> ~/.bash_profile

sudo apt install curl && curl -fsSL https://raw.githubusercontent.com/jacobm3/gbin/main/ubuntu-setup.sh | bash 


## desktop env
sudo snap install bitwarden


echo 'setxkbmap -option caps:swapescape' >> ~/.jacobrc.local

gsettings set org.gnome.desktop.wm.preferences mouse-button-modifier '<Alt>'

  
  
Eric Reeves, 
#!/bin/bash
/usr/bin/setxkbmap -option 'caps:ctrl_modifier'
/usr/bin/xcape -e 'Caps_Lock=Escape' -t 100
Tap Caps Lock, it's Escape.  Hold it, it's Control.
Best of both words.
Just "yay -S xcape" and that little 2 liner will enable it.

  

## local rsync backups
  rsync -v -a \
    --exclude='Documents/g/h' \
    --exclude='**.exe' \
    --exclude='**.terraform**' \
    --exclude='**.git**' \
    /mnt/c/Users/jacob/Documents /mnt/g/backup-optiplex/daily/`date +%Y.%m.%d`
  
  
  
https://unsplash.com/

  
## bpytop
  sudo apt-get update &&  sudo apt install python3-pip && pip3 install bpytop --upgrade

## docker ce
  sudo apt-get install ca-certificates curl gnupg lsb-release
  sudo mkdir -p /etc/apt/keyrings
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
  echo   "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu   $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
  sudo apt-get update
  sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin
  
