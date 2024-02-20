#!/bin/bash -
repo_name=$1
USER=jacobm3
test -z $repo_name && echo "Repo name required." 1>&2 && exit 1
#curl -u 'jacobm3' https://api.github.com/user/repos -d  "{\"name\":\"$repo_name\",\"token\":\"${GITHUB_TOKEN}\"}"
curl -u "${USER}:${GITHUB_TOKEN}" https://api.github.com/user/repos -d  "{\"name\":\"$repo_name\"}"
mkdir $1
cd $1
echo "# $1" >> README.md
git init
git add README.md
git commit -m "first commit"
git remote add origin  https://${USER}:${GITHUB_TOKEN}@github.com/jacobm3/${1}.git
git push -u origin master
git config credential.helper store
