#!/bin/bash

export TOKEN="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"
/usr/bin/curl -H "Authorization: token $TOKEN" -H "Accept: application/vnd.github.v3+json" https://api.github.com/repos/ervaneet82/terraform/commits | jq '.files[].filename'