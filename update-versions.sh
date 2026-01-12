#!/bin/bash
set -exuo pipefail

version=$(curl -fsSL "https://api.github.com/repos/seerr-team/seerr/tags" | jq -re '.[0].name')
json=$(cat meta.json)
jq --sort-keys \
    --arg version "${version//v/}" \
    '.version = $version' <<< "${json}" | tee meta.json
