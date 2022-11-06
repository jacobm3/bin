#!/bin/bash

# This file should contain slack hook url:
# SLACKHOOK=https://hooks.slack.com/services/xxx/yyy/zzz
. ~/.slack.hook.key

URL='http://10.0.0.200/smokeping/'

curl -s $URL >/dev/null  || \
curl -s -X POST -H 'Content-type: application/json' \
        --data "{\"text\":\"Unable to reach $URL \"}" $SLACKHOOK > .slack.smokeping.log 2>&1

