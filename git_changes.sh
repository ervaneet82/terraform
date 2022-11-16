#!/bin/bash

export TOKEN="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"
/usr/bin/curl -H "Authorization: token $TOKEN" -H "Accept: application/vnd.github.v3+json" https://api.github.com/repos/ervaneet82/terraform/commits/${CODEBUILD_SOURCE_VERSION} | jq '.files[].filename'