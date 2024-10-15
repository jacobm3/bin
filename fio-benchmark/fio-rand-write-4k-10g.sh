#!/bin/bash
#
# https://linuxreviews.org/HOWTO_Test_Disk_I/O_Performance
#

ds='date +%Y-%m-%dT%H%M%S%z'
tmpfile="fio.temp.rand-write.file"

fio --name Rand-Write-4k --eta-newline=5s --filename=$tmpfile \
  --rw=randwrite --size=4g --io_size=10g --blocksize=4k --ioengine=libaio \
  --fsync=1 --iodepth=1 --direct=1 --numjobs=32 --runtime=60 \
  --group_reporting --output report-fio-rand-write10G_$($ds).out

rm $tmpfile


