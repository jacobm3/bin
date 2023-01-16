aws ec2 describe-instances --filters "Name=tag:owner,Values=jmartinson@hashicorp.com" \
 "Name=instance-state-name,Values=running" "Name=tag:Name,Values=$1" \
 | jq -r .Reservations[].Instances[].PublicDnsName

