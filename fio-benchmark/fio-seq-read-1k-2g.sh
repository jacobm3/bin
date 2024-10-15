#!/bin/bash
#
# https://linuxreviews.org/HOWTO_Test_Disk_I/O_Performance
#

ds='date +%Y-%m-%dT%H%M%S%z'
tmpfile="fio.temp.seq-read.file"

fio --name Seq-Read-1G --eta-newline=5s --filename=$tmpfile \
    --rw=read --size=1g --io_size=2g --blocksize=1024k \
    --ioengine=libaio --fsync=10000 --iodepth=32 --direct=1 \
    --numjobs=1 --runtime=60 --group_reporting --output report-fio-seq-read1g_$($ds).out

rm $tmpfile
