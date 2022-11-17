#!/bin/bash

#export TOKEN="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"
/usr/bin/curl -H "Authorization: token $TOKEN" -H "Accept: application/vnd.github.v3+json" https://api.github.com/repos/ervaneet82/terraform/commits | jq '.files[].filename'