#!/bin/bash

docker build --pull --rm -t gipert/remage:latest .
docker push gipert/remage:latest &

docker build --pull --rm --build-arg REMAGE_BASE_FLAVOR="slim" -t gipert/remage:slim .
docker push gipert/remage:slim
