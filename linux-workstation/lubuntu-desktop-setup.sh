#!/bin/bash

echo 'CHROMIUM_FLAGS="--disable-gpu"' >> ~/.chromium-browser.init

mkdir -p  ~/.config/htop
cp htoprc.laptop ~/.config/htop/htoprc

ASD=~/.config/autostart
mkdir -p $ASD && cd $ASD

cat > swap_caps_esc.desktop << EOF
[Desktop Entry]
Type=Application
Exec=setxkbmap -option caps:swapescape
Hidden=false
NoDisplay=false
X-GNOME-Autostart-enabled=true
Name=Swap Caps and Esc
Comment=Swaps the Caps Lock and Escape keys
EOF

cat > ksnip.desktop << EOF
[Desktop Entry]
Type=Application
Exec=ksnip
Name=ksnip
EOF

sudo apt install ksnip redshift
