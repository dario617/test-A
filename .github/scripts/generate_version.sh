#! /bin/bash

touch version.json
CURRENT_DATE=$(date -u +"%Y-%m-%dT%H:%M:%SZ")
VERSION=$(uuidgen -s -t)
echo "{\"version\": \"$VERSION\", \"date\": \"$CURRENT_DATE\"}" > version.json

