#!/bin/bash

# https://www.vaultproject.io/api-docs/system/unseal#submit-unseal-key
#
# Run from cron on a trusted remote machine:
# * * * * * /home/ubuntu/bin/unseal-remote-vault.sh

VAULT_ADDR=https://vault.cosmic-security.net:8200

vault status >/dev/null 2>&1 || \
curl -s --request POST --data @.unseal.json \
  ${VAULT_ADDR}/v1/sys/unseal >/dev/null
