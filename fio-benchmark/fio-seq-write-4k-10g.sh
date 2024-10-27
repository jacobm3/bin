#!/bin/bash
#
# https://linuxreviews.org/HOWTO_Test_Disk_I/O_Performance
#

ds='date +%Y-%m-%dT%H%M%S%z'
tmpfile="fio.temp.seq-write.file"

fio --name Seq-Write-4G --eta-newline=5s --filename=$tmpfile \
    --rw=write --size=4g --io_size=10g --blocksize=4096k \
    --ioengine=libaio --fsync=10000 --iodepth=32 --direct=1 \
    --numjobs=1 --runtime=60 --group_reporting --output report-fio-seq-write4g_$($ds).out

rm $tmpfile
