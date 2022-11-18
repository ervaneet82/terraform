#!/bin/bash

#/usr/bin/curl -H "Authorization: token $TOKEN" -H "Accept: application/vnd.github.v3+json" https://api.github.com/repos/ervaneet82/terraform/commits | jq '.files[].filename'

SHA1=`git log --pretty=oneline --abbrev-commit | head -1 | awk -F' ' '{ print $1 }'`
SHA2=`git log --pretty=oneline --abbrev-commit | head -2 | tail -1  | awk -F' ' '{ print $1 }'`

git diff --name-only $SHA2..$SHA1 > test.txt
