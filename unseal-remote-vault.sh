#!/bin/bash

# https://www.vaultproject.io/api-docs/system/unseal#submit-unseal-key

VAULT_ADDR=https://vault.cosmic-security.net:8200

vault status >/dev/null 2>&1 || \
curl -s --request POST --data @.unseal.json \
  ${VAULT_ADDR}/v1/sys/unseal >/dev/null
