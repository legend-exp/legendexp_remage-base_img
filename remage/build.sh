#!/bin/bash

_rmg_version="v0.2.0"

docker build --pull --rm --build-arg REMAGE_VERSION="$_rmg_version" \
             -t gipert/remage:"$_rmg_version" .
docker push gipert/remage:"$_rmg_version"

docker tag gipert/remage:"$_rmg_version" gipert/remage:latest
docker push gipert/remage:latest 

docker build --pull --rm \
    --build-arg REMAGE_VERSION="$_rmg_version" \
    --build-arg REMAGE_BASE_FLAVOR="slim" \
    -t gipert/remage:slim .
docker push gipert/remage:slim
