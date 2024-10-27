#!/bin/bash
#

set -e
set -x

ZRE=/usr/local/bin/zram-enable.sh
sudo tee $ZRE <<EOF
# swap on zram
sudo modprobe zram
sudo zramctl /dev/zram0 --algorithm lzo --size 4GB
sudo mkswap -U clear /dev/zram0
sudo swapon --priority 10 /dev/zram0
EOF
sudo chmod +x $ZRE
#bash ${ZRE}

exit

sudo tee /etc/systemd/system/zram.service <<EOF
[Service]
Type=oneshot
RemainAfterExit=yes
ExecStart=/usr/local/bin/zram-enable.sh

[Install]
WantedBy=multi-user.target
EOF
systemctl enable zram.service
systemctl start zram

# swap on disk
sfile=/swapfile1
sudo btrfs filesystem mkswapfile --size 24G $sfile
sudo swapon --priority 5 $sfile
sudo tee -a /etc/fstab <<EOF
$sfile swap swap defaults 0 0
EOF

