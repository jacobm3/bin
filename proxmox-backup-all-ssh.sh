#!/bin/bash

# Run vzdump over ssh to backup all VM guests on a remote proxmox server

# Server details
PROXMOX_HOST="10.0.0.147"
USERNAME="root"

tmpfile=/tmp/$$.asdf

# SSH and run 'qm list' to get the list of VMs
ssh ${USERNAME}@${PROXMOX_HOST} "qm list | awk '{print \$1,\$2}' | grep -v VMID" > $tmpfile

cat $tmpfile | while read -r LINE; do

  VM_ID=$(echo $LINE | awk '{print $1}')
  VM_NAME=$(echo $LINE | awk '{print $2}')
  echo VM_ID=$VM_ID VM_NAME=$VM_NAME
  ssh ${USERNAME}@${PROXMOX_HOST} vzdump $VM_ID --mode snapshot --compress zstd --stdout </dev/null > vzdump_${VM_ID}_${VM_NAME}_backup.vma.zst

done

rm $tmpfile
