#!/bin/bash

vhost=$(echo $VAULT_ADDR | cut -f3 -d/ | cut -f1 -d:)
version=$(vault status -format=json | jq -r .version)
ts=$(date +%Y.%m.%d_%H:%M:%S_%s)
vault operator raft snapshot save raft_${vhost}_v${version}_${ts}.snap
