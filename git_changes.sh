#!/bin/bash

export TOKEN="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"
/usr/bin/curl -H "Authorization: token $TOKEN" -H "Accept: application/vnd.github.v3+json" https://api.github.com/repos/ervaneet82/terraform/commits | jq '.files[].filename'