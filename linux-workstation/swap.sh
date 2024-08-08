#!/bin/bash
#

set -e
set -x

# swap on zram
sudo modprobe zram
sudo zramctl /dev/zram0 --algorithm lzo --size 4GB
sudo mkswap -U clear /dev/zram0
sudo swapon --priority 10 /dev/zram0

# swap on disk
sfile=/swapfile1
sudo btrfs filesystem mkswapfile --size 24G $sfile
sudo swapon --priority 5 $sfile


