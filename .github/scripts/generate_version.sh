#! /bin/bash

touch version.json
CURRENT_DATE=$(date -u +"%Y-%m-%dT%H:%M:%SZ")
echo "{\"version\": \"$1\", \"date\": \"$CURRENT_DATE\"}" > version.json

