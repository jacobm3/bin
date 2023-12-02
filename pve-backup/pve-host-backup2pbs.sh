#!/bin/bash
VOLUMES="root.pxar:/ pve.pxar:/etc/pve"
NS="pve3"
LOG=/usr/local/sbin/backup.log

export PBS_PASSWORD=your-token
export PBS_REPOSITORY='backup@pbs!client@PBS_IP:datastore-pool-a'
exoprt PBS_FINGERPRINT=9c:ef:29:b8:64:3b:3f:0f:8f:d0:3f:c5:a7:c5:0b:a3:6c:46:59:fa:8a:25:7b:23:1c:0a:c9:d4:b9:ea:88:5b

 
/usr/bin/proxmox-backup-client backup $VOLUMES --ns $NS >>$LOG 2>&1
exit $?
