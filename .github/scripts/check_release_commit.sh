#!/bin/bash

prepare_env(){
    # Prepare package environment

    echo "Preparing environment"

    mkdir type_definitions
    cp src/API.ts type_definitions/index.ts
    cp .github/tsconfig.json type_definitions/tsconfig.json
    cd type_definitions
    cat > ./package.json << EOF
{
  "name": "@bemmbo/bemmbo-graphql-types",
  "version": "$1",
  "description": "Graphql schema type validators",
  "repository": {
    "url": "https://github.com/Bemmbo/bemmbo-web"
  },
  "publishConfig": {
    "registry": "https://npm.pkg.github.com/@bemmbo"
  },
  "main": "dist/index.js",
  "types": "dist/index.d.ts",
  "scripts": {
    "build": "tsc",
    "test": "echo \"Error: no test specified\" && exit 1"
  },
  "prepare": "npm run build",
  "author": "Bemmbo team",
  "license": "ISC"
}
EOF
    mkdir dist

    echo "Install and compile typescript"
    npm install
    npm run build
    echo "Publish package"
    npm publish
}

echo "Changes to the schema.graphql file were found."
prepare_env $GIT_HASH
