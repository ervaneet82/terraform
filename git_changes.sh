#!/bin/bash

export TOKEN="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"
/usr/bin/curl -H "Authorization: token $TOKEN" -H "Accept: application/vnd.github.v3+json" https://api.github.com/repos/ervaneet82/terraform/commits | jq '.files[].filename'