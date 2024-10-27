#!/bin/bash
#
# https://linuxreviews.org/HOWTO_Test_Disk_I/O_Performance
#

ds='date +%Y-%m-%dT%H%M%S%z'
tmpfile="fio.temp.rand-read.file"

fio --name Rand-Read-4k --eta-newline=5s --filename=$tmpfile \
  --rw=randread --size=1g --io_size=4g --blocksize=4k --ioengine=libaio \
  --fsync=1 --iodepth=1 --direct=1 --numjobs=32 --runtime=60 \
  --group_reporting --output report-fio-rand-read4k_$($ds).out

rm $tmpfile


