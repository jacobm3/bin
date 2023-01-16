#!/bin/bash 

REPO_NAME=$1
USER=jacobm3

test -z $REPO_NAME && echo "Repo name required." 1>&2 && exit 1

# REPO SETUP

echo "Creating repo https://github.com/jacobm3/${REPO_NAME}.git"
curl -u "${USER}:${GITHUB_TOKEN}" https://api.github.com/user/repos -d "{\"name\":\"$REPO_NAME\"}"

mkdir $1
cd $1
echo "# $1" >> README.md
echo > .gitignore  <<EOF
#  Local .terraform directories
**/.terraform/*

# .tfstate files
*.tfstate
*.tfstate.*

# .tfvars files
*.tfvars
*.log
EOF

git init
git add README.md .gitignore
git commit -m "first commit"
git remote add origin https://${USER}:${GITHUB_TOKEN}@github.com/jacobm3/${1}.git
git push -u origin master
git config credential.helper store


# TFE SETUP

HOST=app.terraform.io
ORG=jacobm3
WS=$REPO_NAME

tfe workspace create -tfe-address $HOST -tfe-org $ORG -tfe-workspace $WS -vcs-id $ORG/$WS

tfe pushvars -dry-run false -overwrite-all true -name ${ORG}/${WS} \
 -tfe-address $HOST \
 -env-var ARM_SUBSCRIPTION_ID=$ARM_SUBSCRIPTION_ID \
 -env-var ARM_TENANT_ID=$ARM_TENANT_ID \
 -env-var ARM_CLIENT_ID=$ARM_CLIENT_ID \
 -senv-var ARM_CLIENT_SECRET=ARM_CLIENT_SECRET

