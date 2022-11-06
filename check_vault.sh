#!/bin/bash

SLACKHOOK=https://hooks.slack.com/services/xxx/yyy/zzz
export VAULT_ADDR=https://xxxx:8200/

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

