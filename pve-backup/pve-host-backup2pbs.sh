#!/bin/bash
VOLUMES="root.pxar:/ pve.pxar:/etc/pve"
NS="pve3"
LOG=/usr/local/sbin/backup.log

export PBS_PASSWORD=your-token
export PBS_REPOSITORY='backup@pbs!client@PBS_IP:datastore-pool-a'
 
/usr/bin/proxmox-backup-client backup $VOLUMES --ns $NS >>$LOG 2>&1
exit $?
