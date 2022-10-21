#!/usr/bin/env bash

set -e

./scripts/build.sh

id=$(docker build -q -f - . < <(echo "
FROM alpine
COPY . /wrk"))
docker run -w /test "$id" sh -c "
set -e
apk add --update nodejs npm git
npm install /wrk
node -e 'require(\"tigerbeetle-node\")'
"
