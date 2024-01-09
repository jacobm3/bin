#!/bin/bash

echo Your condensed ZFS ZED config:
cat /etc/zfs/zed.d/zed.rc | grep -v '^\s*$' | grep -v '^#'
echo
echo Generating test notification
set -x
cd /tmp
dd if=/dev/zero of=sparse_file bs=1 count=0 seek=100M
zpool create test /tmp/sparse_file
zpool scrub test
zpool export test
rm sparse_file
