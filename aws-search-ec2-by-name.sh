aws ec2 describe-instances --output=text --filters 'Name=tag:Name,Values=jacobm-consul-poc-*' \
 --query "Reservations[*].Instances[*].PublicIpAddress"
