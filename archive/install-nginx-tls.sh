#!/bin/bash

sudo apt install nginx scrub

CN=web2-east.theneutral.zone
sudo tee /etc/nginx/sites-available/${CN} <<EOF
server {
    listen 443 ssl;
    listen [::]:443 ssl;
    server_name ${CN};
    #root /var/www/${CN}/html;
    index index.html index.htm index.nginx-debian.html;
    ssl_certificate /etc/ssl/certs/${CN}.crt;
    ssl_certificate_key /etc/ssl/private/${CN}.key;
}
EOF
sudo ln -s /etc/nginx/sites-available/${CN} /etc/nginx/sites-enabled/${CN}
sudo systemctl restart nginx

