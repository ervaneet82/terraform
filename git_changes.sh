#!/bin/bash

export TOKEN = "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"
curl -H "Authorization: token $TOKEN" -H "Accept: application/vnd.github.v3+json" https://api.github.com/repos/OWNER/REPO/commits/${CODEBUILD_SOURCE_VERSION} | jq '.files[].filename'