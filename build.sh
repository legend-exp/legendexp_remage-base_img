#!/bin/bash

docker build --pull --rm -t gipert/remage-base:slim -f Dockerfile.slim .
docker push gipert/remage-base:slim &

docker build --pull --rm -t gipert/remage-base:G4.11.3 -f Dockerfile.G4-11-3 .
docker push gipert/remage-base:G4.11.3 &

docker build --pull --rm --build-arg CMAKE_BUILD_TYPE="RelWithDebInfo" \
             -t gipert/remage-base:G4.11.3-debuginfo -f Dockerfile.G4-11-3 .

docker build --pull --rm -t gipert/remage-base:latest .
docker push gipert/remage-base:latest
