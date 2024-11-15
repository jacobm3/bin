#!/bin/bash
#

set -e
set -x

ZRE=/usr/local/bin/zram-enable.sh
sudo tee $ZRE <<EOF
#!/bin/bash
#
# swap on zram 
sudo modprobe zram
sudo zramctl /dev/zram0 --algorithm lzo --size 4GB
sudo mkswap -U clear /dev/zram0
sudo swapon --priority 10 /dev/zram0
EOF
sudo chmod +x $ZRE
#bash ${ZRE}


sudo tee /etc/systemd/system/zram.service <<EOF
[Service]
Type=oneshot
RemainAfterExit=yes
ExecStart=/usr/local/bin/zram-enable.sh

[Install]
WantedBy=multi-user.target
EOF
sudo systemctl enable zram.service
sudo systemctl start zram

