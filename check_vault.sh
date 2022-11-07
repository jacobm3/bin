#!/bin/bash

SLACKHOOK=https://hooks.slack.com/services/xxx/yyy/zzz
export VAULT_ADDR=https://xxxx:8200/

# cron entry
# */5  7-23  * * 1-5 /home/ubuntu/bin/check_vault.sh
# */10 10-22 * * 0,6 /home/ubuntu/bin/check_vault.sh


dir=/home/ubuntu/bin
cd $dir

file=.vault.slack.msg
out=.vault.status.out

date > .vault.check.date

vault status > $out 2>&1 

if [ $? -eq 0 ]; then
  exit 0
fi


echo '{"text": "ERR: ' > $file

cat $out | sed 's/"/\\"/g' | sed 's/$/\\n/' >> $file

echo '"}' >> $file

curl -X POST -H 'Content-type: application/json' \
	--data @$file $SLACKHOOK > .slack.log 2>&1 

